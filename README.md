# Todo App V2  
![CI/CD](https://github.com/22111917/todo-app-v2/actions/workflows/ci-cd.yml/badge.svg)  
![Python](https://img.shields.io/badge/Python-3.12-blue)  
![Flask](https://img.shields.io/badge/Flask-3.0.3-green)  
![Docker](https://img.shields.io/badge/Docker-Desktop-blue)  

> **Aplikasi Todo List Sederhana dengan Flask + Docker + CI/CD Otomatis**  
> Tugas Akhir
o	Nicholas Tio (22111917)
o	Constantin Anggriano (221112405)

---

## Deskripsi Proyek
Aplikasi web sederhana untuk mengelola **daftar tugas (Todo List)** dengan fitur:
- Tambah tugas
- Hapus tugas
- Edit tugas (double-click)
- Responsif (mobile & desktop)
- Containerisasi dengan **Docker**
- **CI/CD otomatis** via GitHub Actions

---

## Fitur Utama

| Fitur | Keterangan |
|------|-----------|
| **Frontend** | HTML, Bootstrap 5, CSS Custom, JavaScript |
| **Backend** | Python Flask (REST API) |
| **Container** | Docker (python:3.12-slim) |
| **CI/CD** | GitHub Actions (build, test API) |
| **Kontainerisasi** | `docker build`, `docker run` |
| **Otomasi Lokal** | `start-todo.bat` (menu 1-7) |

---


---

## Cara Menjalankan (Windows)

### Prasyarat
1. **Install [Docker Desktop](https://www.docker.com/products/docker-desktop)**
2. Pastikan Docker berjalan (ikon tray hijau)

### Langkah-langkah
1. **Download ZIP proyek**
2. **Ekstrak ke folder**
3. **Double-click `start-todo.bat`**
4. Pilih menu:
   - `[1]` → Rebuild & jalankan
   - `[5]` → Lihat log
   - `[6]` → Buka browser
5. Buka: [http://localhost:5000](http://localhost:5000)

> **Tidak perlu Python, Flask, atau Git!**

---

## API Endpoints

| Method | Endpoint | Fungsi |
|-------|----------|-------|
| `GET` | `/` | Halaman utama |
| `GET` | `/todos` | Ambil semua todo |
| `POST` | `/todos` | Tambah todo (`{"task": "Belajar"}`) |
| `DELETE` | `/todos/0` | Hapus todo index ke-0 |

---

## CI/CD dengan GitHub Actions

### Workflow: `.github/workflows/ci-cd.yml`
- **Trigger:** Push ke `main`
- **Jobs:**
  1. Checkout kode
  2. Setup Python 3.12
  3. Build Docker image
  4. Jalankan container
  5. Test API (`curl`)
  6. Cleanup

**Status:**  
![CI/CD](https://github.com/22111917/todo-app-v2/actions/workflows/ci-cd.yml/badge.svg)

---

## Demo Aplikasi

### Tampilan Desktop
<img width="922" height="599" alt="image" src="https://github.com/user-attachments/assets/6885c58d-b40b-4703-bbeb-22b0caffe610" />
<img width="761" height="436" alt="image" src="https://github.com/user-attachments/assets/12bb514f-1187-430d-b33e-21cb9e1ea3e5" />
<img width="780" height="351" alt="image" src="https://github.com/user-attachments/assets/0159ba16-699f-4b35-984e-78a4ead6526b" />




---

## Kontribusi
Nicholas Tio (22111917)
•	Bertanggung jawab atas pengembangan backend API menggunakan Python dan Flask
•	Merancang dan membuat Dockerfile untuk kontainerisasi aplikasi
•	Mengimplementasikan logika untuk Tambah, Edit, dan Hapus tugas
•	Membuat script start-todo.bat untuk otomatisasi lokal
Constantin Anggriano (22111917)
•	Bertanggung jawab atas desain UI/UX dan pengembangan frontend (HTML, Bootstrap, JS)
•	Mengintegrasikan frontend dengan backend API
•	Merancang dan mengimplementasikan alur kerja CI/CD menggunakan GitHub Actions
•	Melakukan testing API pada pipeline CI

---

## Lisensi




