#!/usr/bin/env python3
import requests
import datetime
import os
import subprocess
import time

# Koordinat Jakarta Barat (bisa disesuaikan jika bepergian)
LATITUDE = "-6.1683"
LONGITUDE = "106.7588"

def get_prayer_times():
    today = datetime.date.today().strftime("%d-%m-%Y")
    # Menggunakan Aladhan API berdasarkan koordinat, metode Kemenag/SIHAT (Method 11)
    url = f"https://api.aladhan.com/v1/timings/{today}?latitude={LATITUDE}&longitude={LONGITUDE}&method=11"
    try:
        response = requests.get(url, timeout=10)
        data = response.json()
        return data['data']['timings']
    except Exception:
        return None

def main():
    timings = get_prayer_times()
    if not timings:
        print('{"text": "Offline", "tooltip": "Gagal mengambil data"}')
        return

    # Filter sholat fardhu saja + Syuruk (opsional)
    prayers = {
        "Subuh": timings["Fajr"],
        "Syuruk": timings["Sunrise"],
        "Dzuhur": timings["Dhuhr"],
        "Ashar": timings["Asr"],
        "Maghrib": timings["Maghrib"],
        "Isya": timings["Isha"]
    }

    now_str = datetime.datetime.now().strftime("%H:%M")
    current_time = datetime.datetime.strptime(now_str, "%H:%M")

    next_prayer = None
    next_prayer_time = None
    tooltip_text = "Today's Prayer Schedule:\\n"

    for name, p_time in prayers.items():
        tooltip_text += f"{name}: {p_time}\\n"
        p_datetime = datetime.datetime.strptime(p_time, "%H:%M")
        
        if p_datetime > current_time and next_prayer is None:
            next_prayer = name
            next_prayer_time = p_time

    # Kalau semua sholat hari ini sudah lewat, berarti berikutnya Subuh besok
    if not next_prayer:
        next_prayer = "Subuh"
        next_prayer_time = prayers["Subuh"]

    # Kirim output format JSON ke Waybar
    # Menampilkan icon masjid, nama sholat berikutnya, dan jamnya
    output_text = f"󱠧 {next_prayer} {next_prayer_time}"
    print(f'{{"text": "{output_text}", "tooltip": "{tooltip_text.strip()}"}}')

    # Fitur Notifikasi Otomatis pas Waktu Adzan
    # Script ini mengecek apakah menit sekarang sama dengan menit adzan
    for name, p_time in prayers.items():
        if name != "Syuruk" and now_str == p_time:
            # Gunakan file flag biar ga nge-spam notifikasi di menit yang sama
            flag_file = f"/tmp/prayer_{name}_{datetime.date.today().strftime('%Y%m%d')}"
            if not os.path.exists(flag_file):
                with open(flag_file, "w") as f:
                    f.write("notified")
                # Kirim notifikasi via dunst/mako
                subprocess.Popen(["notify-send", "-u", "critical", f"Waktu Sholat {name}", f"Sudah memasuki waktu adzan untuk daerah Anda ({p_time})."])
                # OPSIONAL: Putar suara adzan pendek jika punya file .wav/.mp3
                # subprocess.Popen(["mpv", "--volume=80", "/path/to/adzan.mp3"])

if __name__ == "__main__":
    main()