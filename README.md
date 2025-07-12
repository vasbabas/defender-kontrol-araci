# Windows Defender Kontrol Aracı | v1.0

![GitHub Repo stars](https://img.shields.io/github/stars/vasbabas/defender-kontrol-araci?style=social) ![GitHub forks](https://img.shields.io/github/forks/vasbabas/defender-kontrol-araci?style=social)

Bu proje, Windows işletim sistemlerinde yerleşik olarak bulunan Microsoft Defender antivirüs yazılımını, tek bir tıklama ile basit ve hızlı bir şekilde devre dışı bırakmak için geliştirilmiş bir otomasyon aracıdır.

<p align="center">
  <img src="https-logo-of-a-shield-with-a-red-x-mark" alt="Proje Logosu"/>
</p>

---

## 📜 Projenin Amacı Nedir?

Bu araç, özellikle aşağıdaki durumlarda geçici olarak Windows Defender'ı kapatma ihtiyacı duyan kullanıcılar için tasarlanmıştır:

* **Performans Testleri:** Antivirüs yazılımının sistem kaynakları üzerindeki etkisini ölçmek isteyen yazılım geliştiriciler ve sistem analistleri.
* **Yazılım Uyumluluğu:** Windows Defender tarafından yanlışlıkla "tehdit" olarak algılanan (false-positive) ancak güvenilir olduğundan emin olunan yazılımların kurulumu veya çalıştırılması.
* **Gelişmiş Sistem Yönetimi:** Belirli sistem görevleri veya otomasyon betikleri çalıştırılırken antivirüs müdahalesini önlemek.

**UYARI:** Bu araç, sisteminizi siber tehditlere karşı koruyan temel bir güvenlik katmanını devre dışı bırakır. Sadece ne yaptığınızı bildiğinizden emin olduğunuzda ve güvenli bir ortamda kullanın.

---

## 🚀 Nasıl Kullanılır?

Aracı kullanmak son derece basittir. Sadece aşağıdaki adımları izleyin:

1.  **İndirme:**
    * Bu reponun ana sayfasına gidin.
    * Yeşil renkli **`< > Code`** butonuna tıklayın.
    * **"Download ZIP"** seçeneği ile tüm projeyi indirin.
    * ZIP dosyasını bir klasöre çıkartın.

2.  **Çalıştırma:**
    * Klasör içindeki `DefenderKapat.bat` dosyasına **SAĞ TIKLAYIN**.
    * Açılan menüden **"Yönetici olarak çalıştır"** seçeneğini seçin. Bu adım, betiğin sistem ayarlarını değiştirebilmesi için zorunludur.

3.  **Onaylama:**
    * Komut istemi ekranı açılacak ve yapılan işlemleri size gösterecektir.
    * İşlem tamamlandığında, değişikliklerin tam olarak uygulanması için bilgisayarınızı yeniden başlatmanız önerilir.

---

## ⚙️ Teknik Detaylar: Bu Script Ne Yapar?

Bu `.bat` dosyası, yönetici yetkileriyle çalıştırıldığında aşağıdaki komutları sırasıyla uygular:

1.  **PowerShell Ayarları:** `Set-MpPreference` komut seti kullanılarak Defender'ın temel koruma modülleri kapatılır:
    * `DisableRealtimeMonitoring`: Gerçek zamanlı dosya taramasını durdurur.
    * `DisableScanningNetworkFiles`: Ağ üzerindeki dosyaların taranmasını engeller.
    * `DisableBlockAtFirstSeen`: Bulut tabanlı "İlk Görüşte Engelle" korumasını devre dışı bırakır.

2.  **Kayıt Defteri (Registry) Değişikliği:** `reg add` komutu ile `HKLM\SOFTWARE\Policies\Microsoft\Windows Defender` anahtarı altına `DisableAntiSpyware` adında bir `DWORD` değeri eklenir ve `1` olarak ayarlanır. Bu, Defender'ı ilke düzeyinde devre dışı bırakmak için en etkili yöntemlerden biridir.

---

## ⚠️ Önemli Uyarılar ve Sorumluluk Reddi

* **Güvenlik Riski:** Windows Defender'ı devre dışı bırakmak, bilgisayarınızı virüslere, fidye yazılımlarına (ransomware) ve diğer kötü amaçlı yazılımlara karşı **SAVUNMASIZ** bırakır. Bu aracı kullanmanın getireceği tüm riskler tamamen size aittir.
* **Kurcalama Koruması (Tamper Protection):** Windows 10/11'in yeni sürümlerinde bulunan "Kurcalama Koruması" özelliği, bu betiğin çalışmasını engelleyebilir. En iyi sonuçlar için, betiği çalıştırmadan önce bu özelliği manuel olarak kapatmanız gerekebilir: `Windows Güvenliği > Virüs ve tehdit koruması > Ayarları yönet > Kurcalama Koruması`.
* **Sorumluluk:** Bu projenin geliştiricisi, aracın kullanımından kaynaklanabilecek herhangi bir veri kaybı, sistem çökmesi veya güvenlik ihlalinden sorumlu tutulamaz.

Bu projeyi sadece eğitim ve meşru test amaçlı kullanın.

---
