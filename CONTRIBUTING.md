# 🤝 Contributing to Sistem Penjualan Online Sederhana

Terima kasih atas minat Anda untuk berkontribusi! Kami menyambut kontribusi dari siapa saja.

## 🚀 Cara Berkontribusi

### 1. Fork Repository
```bash
# Fork repository ini di GitHub, lalu clone
git clone https://github.com/abifadilahs/Toko-Online-Sederhana.git
cd Toko-Online-Sederhana
```

### 2. Setup Development Environment
```bash
# Pastikan Free Pascal Compiler terinstall
fpc -h

# Compile program untuk testing
fpc index.pas
```

### 3. Buat Branch untuk Feature/Fix
```bash
git checkout -b feature/nama-feature
# atau
git checkout -b fix/nama-bug
```

### 4. Development Guidelines

#### 📝 **Code Style:**
- Gunakan **PascalCase** untuk nama prosedur/fungsi
- Gunakan **camelCase** untuk nama variabel
- Tambahkan komentar untuk logika yang kompleks
- Pastikan indentasi konsisten (2 spaces)

#### 🧪 **Testing:**
- Test semua fitur setelah perubahan
- Pastikan program bisa compile tanpa error
- Test input validation dengan berbagai scenario

#### 📖 **Documentation:**
- Update README.md jika menambah fitur baru
- Update TECHNICAL_DOCS.md untuk perubahan algoritma
- Tambahkan komentar dalam kode untuk fungsi baru

### 5. Commit Changes
```bash
git add .
git commit -m "✨ Add new feature: feature description

- Detail perubahan 1
- Detail perubahan 2
- Fix issue #123"
```

#### 📝 **Commit Message Format:**
```
<type>(<scope>): <description>

[optional body]
```

**Types:**
- `✨ feat` - Fitur baru
- `🐛 fix` - Bug fix
- `📚 docs` - Update dokumentasi
- `💄 style` - Format code (tidak mengubah functionality)
- `♻️ refactor` - Refactor code
- `🧪 test` - Menambah atau memperbaiki tests
- `🔧 chore` - Update build tools, package manager, dll

### 6. Push dan Create Pull Request
```bash
git push origin feature/nama-feature
```

Buat Pull Request di GitHub dengan:
- **Title** yang jelas dan descriptive
- **Description** yang menjelaskan perubahan
- **Screenshots** jika mengubah UI/output

## 🐛 Melaporkan Bug

### Sebelum Melaporkan Bug:
1. Pastikan bug belum dilaporkan di [Issues](https://github.com/abifadilahs/Toko-Online-Sederhana/issues)
2. Test dengan compiler Pascal terbaru
3. Siapkan langkah reproduksi yang jelas

### Format Laporan Bug:
```markdown
**Bug Description:**
Deskripsi singkat tentang bug

**Steps to Reproduce:**
1. Langkah 1
2. Langkah 2
3. Langkah 3

**Expected Behavior:**
Apa yang seharusnya terjadi

**Actual Behavior:**
Apa yang sebenarnya terjadi

**Environment:**
- OS: Windows 10/Linux Ubuntu/macOS
- FPC Version: 3.2.2
- Program Version: v1.0
```

## 💡 Mengajukan Feature Request

1. Cek [Issues](https://github.com/abifadilahs/Toko-Online-Sederhana/issues) untuk memastikan belum ada request serupa
2. Buat issue baru dengan label "enhancement"
3. Jelaskan use case dan benefit dari feature tersebut
4. Diskusikan implementasi jika diperlukan

## 📋 Development Checklist

Sebelum submit Pull Request, pastikan:

- [ ] Code bisa compile tanpa error atau warning
- [ ] Semua fitur berfungsi dengan baik
- [ ] Input validation bekerja proper
- [ ] Documentation telah diupdate jika diperlukan
- [ ] Commit message mengikuti format yang benar
- [ ] Pull Request description jelas dan lengkap

## 🎯 Priority Areas for Contribution

Kami sangat menghargai kontribusi di area berikut:

### 🔥 **High Priority:**
- File persistence (save/load data)
- Search and filter functionality
- Better error handling
- Unit testing framework

### 🚀 **Medium Priority:**
- Performance optimization
- Code refactoring
- Additional validation
- UI/UX improvements

### 💡 **Low Priority:**
- GUI implementation
- Database integration
- Web interface
- Mobile app

## 🙏 Terima Kasih!

Kontribusi Anda sangat berharga untuk pengembangan project ini. Setiap kontribusi, baik kecil maupun besar, akan dihargai dan diakui.

---

**Questions?** Jangan ragu untuk membuat issue atau menghubungi maintainer!