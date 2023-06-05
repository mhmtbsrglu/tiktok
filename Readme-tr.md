<h2 align="center" style="color:#005fbc">Reverse Engineering - Tersine Mühendislik Yapalım ve anlayalım</h2>

<br/>
<br/>

# FFMPEG nedir?

FFMPEG, Türkçeye çevirdiğimizde Hızlı İleri Hareketli Görüntü Uzmanları Grubu anlamına gelir. Video ve ses işleme için birçok araç sunan ücretsiz ve açık kaynaklı bir yazılım projesidir. Bir komut satırı arabiriminde çalışacak şekilde tasarlanmıştır ve video dosyalarını işlemek ve işlemek için birçok farklı kitaplık ve programa sahiptir.

# Hangi firmalar kullanmaktadır?

![alt text](youtube-google-canada.jpg "YouTube")

## YouTube

- Video'ya ait anahtarların işlenmesi.
- Çoğumuzun parmak izi takibi olmadığını sandığı metadata bilgilerin yazdırılması.
- HLS yayınlarını sağlamak amacı ile alt yapısında stream hizmeti sunması.
- Video'nun kapak fotoğrafı için belirli karelerde png formatında export işlemi
- Video'nun kapak fotoğrafını değiştirme hizmeti
- Videoları 480p,720p, 1080p vb. formatlara m3u8 ve ts olarak ayrıştırması.

![alt text](tiktok.jpg "YouTube")

## TikTok

- Video'ya ait anahtarların işlenmesi.
- Çoğumuzun parmak izi takibi olmadığını sandığı metadata bilgilerin yazdırılması.
- HLS yayınlarını sağlamak amacı ile alt yapısında stream hizmeti sunması.
- Video'nun sonuna şirketi temsil eden introların concat edilmesi.
- Video'nun kapak fotoğrafı için belirli karelerde png formatında export işlemi
- Yapay zeka filtrelerin videolara işlenmesi

## Diğer firma/şirket/startuplara ait liste

- Tango App
- Instagram Reels
- Discord
- Azar
- Twitter
- Ford Oto Sanayi
- Evrim Ağacı Tech

# Tiktok, intro ve videonun birleştirme işlemi için hangi komut dizinini kullanmaktadır?

```cmd
ffmpeg -i %Input%.mp4 -i %Input2%.mp4 -filter_complex "[0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0];[1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1];[v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]" -map "[v]" -map "[a]" %Input3%.mp4 -vsync 2

```

## Sırasıyla ne işe yarıyor?

1. -i %Input%.mp4 ve -i %Input2%.mp4: İlk adımda, komut giriş olarak %Input%.mp4 ve %Input2%.mp4 dosyalarını alır. %Input% ve %Input2% yer tutucu değişkenlerdir ve gerçek dosya adlarıyla değiştirilmelidir.

2. -filter_complex: Bu parametre, karmaşık bir filtre zinciri tanımlamak için kullanılır.

3. [0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0] ve [1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1]: Bu adımlarda her iki giriş video dosyası için aynı işlemler gerçekleştirilir. İlk olarak, videoların boyutları 480x854 piksel boyutuna ölçeklenir (scale=480:854). Ardından, videoların orijinal en boy oranı korunarak (force_original_aspect_ratio=decrease) 480x854 boyutunda bir çerçeve oluşturulur (pad=480:854:(ow-iw)/2:(oh-ih)/2). Son olarak, görüntünün en boy oranı 1 olarak ayarlanır (setsar=1). Bu adımların sonucunda, her iki videonun da aynı boyutta ve oranlarda olduğu iki yeni video akışı ([v0] ve [v1]) oluşturulur.

4. [v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]: Bu adımda, concat filtresi kullanılarak [v0], [0:a], [v1] ve [1:a] akışları birleştirilir. n=2 parametresi, iki adet video dosyasının birleştirileceğini belirtir. v=1 ve a=1 parametreleri, birleştirilen çıkış video akışının video ([v]) ve ses ([a]) içereceğini belirtir.

5. -map "[v]" -map "[a]": Bu adımda, birleştirilmiş video akışı ([v]) ve ses akışı ([a]) belirtilen çıkış dosyasına atanır.

6. %Input3%.mp4: Bu parametre, çıkış dosyasının adını belirtir. %Input3% yer tutucu bir değişkendir ve gerçek dosya adıyla değiştirilmelidir.

7. -vsync 2: Bu parametre, video senkronizasyonunu kontrol eder. -vsync 2, giriş video dosyalarının senkronizasyonunu korumak için gereken örnekleme oranını ayarlar.

Sonuç olarak, bu komut iki giriş video dosyasını aynı boyutta ve oranlarda birleştirerek %Input3%.mp4 adlı bir çıkış video dosyası oluşturur.

# Syntax

## Runner.bat

```cmd
start runner.bat
```

## Runner.sh

```bash
bash runner.sh
```

## Runner.sh

```cmd
elixir runner.exs
```

## Runner.java

```cmd
java runner.java
```

### Çalıştırdıktan sonra sonuca büyülenebilirsin

<br/>

![alt text](os.gif "Tepki")
<br/>
<br/>
<br/>

## Tebrikler ! Artık kendi tiktok uygulaman için alt yapının ilk seviyesine giriş yaptın.

![alt text](tebrikler.gif "Tebrikler")
