# CampusFlow Mahasiswa

Portal mahasiswa satu file (`index.html`) dengan pengumpulan tugas (PDF/DOCX/PPTX/XLSX/ZIP/gambar), catatan tambahan, dan sinkronisasi Supabase.

## 1. Supabase
1. Buat project di supabase.com.
2. SQL Editor > jalankan isi `supabase/schema.sql`.
3. Authentication > Users > Add user: email `240511184@campusflow.app`, password `Rimawati123`, centang **Auto Confirm User**. (Login di aplikasi cukup ketik NIM `240511184`.)
4. Project Settings > API: salin **Project URL** dan **anon/publishable key**.
5. Di `index.html` isi `const SB_URL='...',SB_KEY='...';` (cari `SB_URL`).
   Jangan pernah memakai `service_role` key di sini. Anon key aman karena data dilindungi RLS.

## 2. GitHub
```bash
git init && git add . && git commit -m "CampusFlow"
git branch -M main
git remote add origin https://github.com/USERNAME/campusflow.git
git push -u origin main
```
Repo > Settings > Pages > Source: **GitHub Actions**. Situs tayang di `https://USERNAME.github.io/campusflow/`.

## Catatan
- Tanpa Supabase, login lokal: NIM `240511184` + sandi `Rimawati123` (hanya penghalang tampilan, terbaca di source code). Dengan Supabase, login memakai akun Supabase.
- Login Supabase Tombol demo tetap lokal (tanpa sinkron).
- Tanpa isi `SB_URL/SB_KEY`, data tugas tersimpan di browser saja (localStorage + IndexedDB).
