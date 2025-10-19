# 📋 Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### 🔮 Planned Features
- File persistence for products (save/load from file)
- Search functionality for products
- Enhanced capacity management
- Performance optimizations

## [1.1.0] - 2025-10-19

### ✨ Added
- **MIT License** - Added open source license for legal clarity
- **CONTRIBUTING.md** - Guidelines for contributors
- **CHANGELOG.md** - Version history tracking
- **Professional Documentation** - Comprehensive README and technical docs

### 🔧 Improved
- **Git Workflow** - Proper fork/upstream setup for contributions
- **Repository Structure** - Clean and organized file structure

## [1.0.0] - 2025-10-19

### ✨ Added
- **Complete Program Refactor** - Clean, structured Pascal code
- **Input Validation** - `BacaAngka()` function prevents crashes from invalid input
- **Currency Formatting** - `FormatRupiah()` with thousand separators (Rp 1.500.000)
- **Professional UI** - Consistent menu design and table formatting

### 🏪 Product Management
- **Add Products** - Input nama, harga, stok with validation
- **Edit Products** - Modify existing product data (name/price/stock/all)
- **Delete Products** - Remove products with confirmation
- **View Products** - Display products in formatted table

### 🛒 Shopping System
- **Shopping Cart** - Add products with quantity validation
- **Stock Management** - Automatic stock reduction after purchase
- **Invoice Generation** - Calculate subtotal, shipping cost, and total
- **Checkout Process** - Complete transaction with receipt

### 🔧 Technical Improvements
- **Error Handling** - Comprehensive validation for all user inputs
- **Memory Management** - Efficient array usage for products and cart
- **Code Structure** - Modular design with utility functions
- **Data Types** - Proper use of `longint` for prices, `integer` for stock

### 📚 Documentation
- **README.md** - User guide with installation and usage instructions
- **TECHNICAL_DOCS.md** - Developer documentation with function explanations
- **Code Comments** - Clean, minimal but effective commenting

### 🛠️ Development Setup
- **.gitignore** - Pascal development environment configuration
- **Compilation** - Tested with Free Pascal Compiler 3.2.2

## [0.1.0] - Initial Version

### ✨ Added
- Basic Pascal program structure
- Simple product input functionality
- Basic shopping cart concept
- Console-based interface

### 🚫 Limitations in Initial Version
- No input validation (crashed on invalid input)
- No proper error handling
- Limited documentation
- Basic UI without formatting
- No currency formatting

---

## 📝 Version Naming Convention

- **Major** (X.0.0) - Breaking changes, major feature additions
- **Minor** (0.X.0) - New features, backward compatible
- **Patch** (0.0.X) - Bug fixes, small improvements

## 🏷️ Types of Changes

- `✨ Added` - New features
- `🔧 Changed` - Changes in existing functionality  
- `🗑️ Deprecated` - Soon-to-be removed features
- `❌ Removed` - Removed features
- `🐛 Fixed` - Bug fixes
- `🔒 Security` - Security fixes