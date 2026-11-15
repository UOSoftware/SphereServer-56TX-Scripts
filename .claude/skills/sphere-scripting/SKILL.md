---
name: sphere-scripting
description: SphereServer 0.56TX (Source-X tabanlı, 0.56b/T oynanışlı Ultima Online emulatörü) için SCP script yazma, düzeltme ve inceleme. ITEMDEF, CHARDEF, TYPEDEF, EVENTS, FUNCTION, DIALOG, SPEECH, TEMPLATE, SPAWN, AREADEF bölümleri; ON=@Tetikleyici; IF/ELIF/FOR/WHILE/DORAND sözdizimi; <...> ifadeleri, LOCAL/TAG/VAR/ARGS; STRCMP ve QVAL; cliloc mesajları (SYSMESSAGELOC); varsayılan paketin (SphereServer-56TX-Scripts) klasör düzeni ve sunucuda doğrulama. Bir .scp dosyasına dokunan, "sphere script", "Sphere'de şunu yapan script", "NPC/eşya/büyü/dialog/skill/spawn yaz", "@DClick (ya da başka bir @tetikleyici) ekle", "pakete fonksiyon ekle", "bu script neden çalışmıyor" diyen her istekte, kullanıcı "skill" ya da "Sphere" demese de yükle; Sphere'in script dili genel bilgiden yazılınca 0.56b, X ve forum lehçeleri karışır, buradaki kurallar 56TX exe'siyle doğrulanmıştır.
---

# SphereServer 0.56TX script yazımı

Bu skill, varsayılan script paketinin (`SphereServer-56TX-Scripts`) ve 56TX emulatörünün dilini anlatır. Buradaki her
sözdizimi kuralı emulatörün exe'siyle ölçülmüştür; ölçümün kendisi `references/syntax-verified.scp` (her satırı bir
`TEST|ad|alınan|beklenen` sonucu). Bir kuraldan şüphelenince önce o dosyaya bak, sonra sunucuda dene. Anahtar kelime,
tetikleyici, ayar ve defname listeleri `references/` altında motorun kaynağından üretilir (elle yazılmaz); bir adın
var olup olmadığını oradan doğrula, uydurma.

| Dosya | Ne zaman okunur |
|---|---|
| `references/syntax-verified.scp` | Bir sözdizimi kuralını, sayı ya da metin davranışını doğrulamak için |
| `references/keywords.md` | "Bu nesnede bu özellik/komut var mı?" (nesne türüne göre bütün adlar) |
| `references/triggers.md` | Tetikleyicinin tam adı ve motorun açıklaması |
| `references/ini-settings.md` | Davranışı değiştiren ayarlar (`<SERV.Ayar>`), gömülü değerleri |
| `references/engine-defnames.md` | Motorun tanımladığı sabitler (`attr_*`, `statf_*`, `layer_*`, `spellflag_*`...) |
| `references/serv-functions.md` | Sunucu olay fonksiyonları `f_on*` ve argümanları |
| `references/pack-layout.md` | Yeni dosyanın hangi klasöre gideceği ve yükleme sırası |

Emulatörün kaynağı yanındaysa (`../../Servers/SphereServer-56TX`) bir anahtar kelimenin ne yaptığını ve bir
tetikleyicinin argümanlarını orada ara (`Grep "\"ANAHTAR\"" src/`, `Grep "CTRIG_Ad\b" src/game`); yoksa paketteki
kullanımlarına bak (`Grep "ON=@Ad" -i`). 0.56b/T ile X'in ayrıldığı kurallar emulatörün `docs/Comparison.md`'sinde.

## İş akışı

1. **İsteği netleştir.** Hangi nesne (eşya, NPC, oyuncu, bölge, sunucu), hangi olay (tetikleyici), ne yapacak, oyuncu
   ne görecek. Oynanış kuralı belirsizse seçenekleri sorup öyle yaz.
2. **Pakette benzerini bul.** Aynı türden bir bölüm ya da aynı tetikleyiciyi kullanan bir script varsa onun düzenini al
   (`Grep`); paket tutarlı kalır ve çalışan bir örnekten başlarsın.
3. **Dosyayı yerine koy.** Ana bölüm türünün klasörüne (`references/pack-layout.md`); klasörü `[RESOURCES]`'ta yoksa
   `spheretables.scp`'ye satır ekle. Dosya adı paket genelinde tekil, `sphere_` öneki yok. Dosya UTF-8 (BOM'suz), LF.
4. **Yaz.** Aşağıdaki kurallarla; mesajlar cliloc numarasıyla (56TX bölümü); Türkçe karakter metinlerde serbest.
5. **Sunucuda doğrula.** Yüklenmeyi ve mantığı exe'yle dene (Doğrulama bölümü); log'daki `ERROR:` satırlarını oku.
   Yazdığına güvenmek yerine sunucuya sor.
6. **Commit.** Paketin reposunda, Türkçe mesajla, sadece kendi dosyalarınla (`git add <dosya>`; `git add -A` yok).
   Emulatöre yeni bir anahtar kelime gerekiyorsa o ayrı iş: emulatör reposunda yapılır, paket onunla birlikte güncellenir.

## Dosya ve bölüm düzeni

- Dosya `[BÖLÜM ad]` başlıklarından oluşur; başlık satırı bölümü açar, sonraki başlığa kadar sürer. Son satır `[EOF]`.
- Bölüm türleri: `DEFNAME`, `ITEMDEF`, `CHARDEF`, `MULTIDEF`, `TYPEDEF`, `EVENTS`, `FUNCTION`, `DIALOG`, `SPEECH`,
  `TEMPLATE`, `SPAWN`, `SPELL`, `SKILL`, `SKILLCLASS`, `AREADEF`, `ROOMDEF`, `REGIONTYPE`, `REGIONRESOURCE`,
  `TELEPORTERS`, `MOONGATES`, `BONUS`, `COMMENT`. Yükleme sırası önemlidir: DEFNAME'ler önce, TYPEDEF ve EVENTS
  sonra, ITEMDEF/CHARDEF, bölgeler, TEMPLATE en son (`[RESOURCES]` yukarıdan aşağı okunur).
- `//` satırın geri kalanını yorum yapar, tırnak içinde de; tek istisna `://` (URL'ler kalır). Yorumu satır sonuna değil
  üst satıra yaz. Bir `[COMMENT]` bölümünün satırı `[` ile başlamaz (yeni bölüm açar).
- Bölümün içinde `ANAHTAR=değer` satırları tanımın alanlarıdır; `ON=@Tetikleyici` satırı bir tetikleyici bloğu açar,
  blok sonraki `ON=` ya da bölüm başlığına kadar sürer. `[FUNCTION ad]`'ın gövdesi doğrudan başlıkla başlar.
- Girinti serbest (paket tab ya da 1-4 boşluk kullanır); büyük-küçük harf farksız. Paket anahtar kelimeleri büyük
  (`IF`, `ENDIF`, `SRC.SYSMESSAGELOC`), defname'leri küçük (`i_gold`, `c_man`, `t_potion`) yazar.

## Sözdizimi (exe'yle doğrulanmış)

### Koşullar

```
IF (<ISPLAYER>) && (<ARGN1> > 0)
    ...
ELIF (<ISNPC> && <NPC> == brain_vendor)
    ...
ELSE
    ...
ENDIF
```

- Her yan kendi parantezinde ve `&&`/`||` boşluklarla ayrılmış: `IF (a) && (b)`; ya da hepsi tek parantezde:
  `IF (a && b)`. Ayrıştırıcı `(a)&&(b)` ve parantezsiz `IF a && b` yazımını da kabul eder, ama paket öyle yazmaz.
- Değillemek: `!(<x>)`, `IF !(<LOCAL.ok>)`, `IF (<a>) && !(<b>)`. İntrinsic'te `IF !STRCMP(<NAME>,Ali)`.
- Karşılaştırma: `==`, `!=`, `<`, `<=`, `>`, `>=`; bit: `&`, `|` (`IF (<FLAGS> & statf_dead)`). `<` ve `>` IF satırında
  rahatça kullanılır; `<...>` ifadesinin içinde de çalışır (`<QVAL <LOCAL.b> > 3 ? a:b>`).
- **Tembel değerlendirme:** `&&`'in solu 0 ise, `||`'nin solu 1 ise sağ taraf hiç çalışmaz. Geçersiz nesneyi önce
  sına: `IF (<LINK.ISVALID>) && (<LINK.TAG0.x> == 1)` hata vermez.
- `IF <x>` tek başına: sayı 0 değilse doğru. Metin için kullanma (aşağıda, Metin).

### Döngüler ve bloklar

| Yazım | Anlam |
|---|---|
| `FOR 1 5` ... `ENDFOR` | 1'den 5'e, 5 kez; sayaç `<LOCAL._FOR>`. `FOR 3` 1..3 (3 kez); `FOR 0 2` 0..2 (3 kez) |
| `WHILE (<LOCAL.c> < 4)` ... `ENDWHILE` | koşul doğruyken |
| `FORITEMS n` / `FORCHARS n` / `FOROBJS n` / `FORPLAYERS n` / `FORCLIENTS n` | nesnenin n kare çevresindeki yerdeki eşyalar / karakterler (kendisi dahil) / ikisi / oyuncular / client'lar; gövde her nesnenin üstünde çalışır (`<UID>`, `<NAME>`), nesneye komut doğrudan |
| `FORCONT <uid> [derinlik]` / `FORCONTID i_x` / `FORCONTTYPE t_x` | bir container'ın içindekiler / nesnenin çantasındaki o ID'liler / o türdekiler. Yığılan eşya tek nesnedir: iki altın bir yığın, `<AMOUNT>` 2 |
| `FORCHARLAYER n`, `FORCHARMEMORYTYPE n`, `FORINSTANCES defname`, `FORTIMERF`, `FORTYPES`, `FORALL*` | ayrıntısı keywords.md; `FORALLITEMS`/`FORALLCHARS` bütün dünyayı dolaşır, pahalıdır |
| `BREAK`, `CONTINUE` | döngüden çıkar / sonraki tura geçer |
| `DOSWITCH n` ... `ENDDO` | n'inci satır çalışır, **0'dan** sayılır (`DOSWITCH 1` ikinci satır) |
| `DORAND n` ... `ENDDO` | n satırdan rastgele biri |
| `BEGIN` ... `END` | sadece gruplama |
| `RETURN [değer]` | fonksiyondan ya da tetikleyiciden çıkar; tetikleyicide `RETURN 1` motorun varsayılan işini durdurur, `RETURN 0` sürdürür; fonksiyonun değeri `<f_ad args>` ile okunur |

Döngü ve blok anahtar kelimeleri satır başında, argümanları köşeli parantezsiz. Nesne döngüsü, döngüyü çalıştıran
nesnenin konumuna bakar: `f_onserver_start` gibi nesnesiz yerden `REF1.f_ad` ile bir nesnenin üstünde çağır.

### İfadeler ve sayılar

- `<...>` içindeki her şey hesaplanır ve yerine metni konur; iç içe olabilir (`<REF1.TAG0.<LOCAL.anahtar>>`). Satırda
  düz `<` ya da `>` karakteri yazma (ifade sanılır); gerekirse `<CHR 60>`/`<CHR 62>`.
- Öncelik yok, sağdan sola: `2*3+1` = 8, `10-2-3` = 5. Parantezle sırala: `(2*3)+1` = 7. Bölme tam sayı (`7/2` = 3),
  `%` kalan. Ondalık hesap `<FLOATVAL 7.0/2.0>` (3.500000); `<FVAL 35>` onda birlik (3.5).
- **Sayı yazımı:** `0` ile başlayan sayı onaltılıktır: `0ff` 255, `010` 16. Ondalık için `0` ile başlama. Çıplak
  harfli bir kelime (`abc`, `Hello`) sayı değil **ad**dır: defname aranır, bulunamazsa "Undefined symbol" hatası ve 0.
- **Sayılar onaltılık yazdırılır:** `LOCAL`, `VAR`, `TAG` ve `DEF`'teki sayı okununca `0` önekli onaltılık gelir
  (`LOCAL.x=255` → `<LOCAL.x>` `0ff`, `LOCAL.r=1` → `01`, `zz_val 42` → `02a`). Nesne özellikleri (`AMOUNT`, `ARGN1`,
  `HITS`...) çoğunlukla ondalık. Oyuncuya göstermek ya da metin birleştirmek için **ondalık okut:** `<dLOCAL.x>`,
  `<dTAG0.x>`, `<dAMOUNT>`, `<EVAL <DEF.x>>`. Karşılaştırmada fark etmez: `IF (<LOCAL.x> == 255)` doğru çalışır.
- Rakamlardan oluşan metin sayı olur: `LOCAL.e=12` sonra `LOCAL.e=<LOCAL.e>34` → `0c34`. Metin birleştirmede harf
  bulundur ya da `<dLOCAL.e>` kullan.
- Rastgele: `<R5,10>` 5-10; `{1 5}` iki değerli küme **aralıktır** (1..5 rastgele), ağırlıklı seçim en az iki çift:
  `{i_gold 3 i_gem 1}` (değer ağırlık değer ağırlık); `<EVAL {7 1 7 1}>` 7.
- Koşullu değer: `<QVAL koşul ? a:b>`; `:`'dan önce boşluk bırakırsan ilk dal boşlukla biter (`"yes "`). Dalda
  kapanmayan parantez yazma.
- Defname ifadede sayıdır: `<EVAL zz_val+1>`, `IF (<BASEID> == c_man)`, `IF (<TYPE> == t_potion)` çalışır.
  `<DEF.ad>` `[DEFNAME]` değerini verir (yoksa boş), `<DEF0.ad>` yoksa 0; ITEMDEF/CHARDEF adının numarası
  `<RESDEF.i_gold>` (`<DEF.i_gold>` boştur). `ITEMDEF` alanları `<SERV.ITEMDEF.i_x.NAME>` ile.

### Metin

- **`==` ile metin karşılaştırma yanlıştır:** iki taraf ad sanılır, tanımsız ad 0 olur ve `Hello == World` doğru çıkar.
  Metin için intrinsic'ler: `STRCMP(a,b)` (0 = eşit), `STRCMPI` (harf duyarsız), `STRMATCH(kalıp,metin)` (`*`, `?`),
  `STRLEN(metin)`, `STRINDEXOF`, `STRREGEX`. Köşeli parantezsiz ve parantezli yazılır:
  `IF (STRCMP(<NAME>,Zz Syntax Man) == 0)`, `IF !STRCMPI(<ARGS>,evet)`, `IF (STRMATCH(Hel*,<LOCAL.s>))`.
  `<STRCMP ...>` yazımı çözülmez ("Can't resolve"), 0 döner.
- `IF (<LOCAL.metin>)` metin için güvenilmez (ad aranır). Boşluk sınaması: `<ISEMPTY <x>>` (boş metin 1), `<ISBLANK <x>>`
  (boş, 0 ya da eksi 1: tanımsız TAG0 ve LOCAL için bunu kullan).
- `<>`'li metin yardımcıları (her nesnede, `references/keywords.md` ilk bölüm): `<STRTOLOWER x>`, `<STRTOUPPER x>`,
  `<STRTITLE x>`, `<STRTRIM x>`, `<STRLENGTH x>` (harf sayısı), `<STRREPLACE aranan,yeni,metin>`,
  `<STRCONTAINS aranan,metin>` (aranan önce), `<STRSTARTSWITH aranan,metin>`, `<STRSUB>`, `<STRARG>`, `<STREAT>`,
  `<STRLIMIT sayı,metin>`, `<STRSLUG>`, `<STRSQLSAFE>`, `<EXPLODE>`, `<ISALPHA>`, `<ISDIGITS>`, `<NUMBERFORMAT>`,
  `<DATEFORMAT>`... Virgülle ayrılan baştaki argümanlar tırnakla yazılabilir, son argüman metnin geri kalanıdır.
- Metin değerleri tırnaksız yazılır: `NAME=Zz Coin`, `LOCAL.s=Hello World`. Tırnak gerektiğinde `"..."`; satır sonu
  boşlukları atılır.

### Değişkenler ve bağlam

| Ad | Kapsam | Tanımsızken |
|---|---|---|
| `LOCAL.x` | çalışan fonksiyon/tetikleyici; çağrılan fonksiyona geçmez (ARGS ile ver) | `0` (boşaltılan da `0`) |
| `VAR.x` / `VAR0.x` | sunucu geneli, save'e girer | boş / `0` |
| `TAG0.x` | nesnede (eşya, karakter, bölge, hesap), save'e girer. **Tag'i her zaman `TAG0` ile yaz ve oku:** `TAG0.x=değer`; `TAG0.x=0` ya da `TAG0.x=` tag'i siler (save'e 0 girmez; `TAG.x=0` 0'ı saklar). Hiç set edilmemiş tag `<TAG0.x>` ile 0 okunur, `<TAG.x>` ile boş: `IF (<TAG.x> == 1)` `( == 1)` olur, "Undefined symbol ''" hatası verir ve sonucu rastgeledir (`== 0` doğru, `== 1` yanlış, `< 5` doğru çıkar). `<TAG.x>` sadece boş metinle 0'ı ayırmak gerekince | `0` (`TAG.x` boş) |
| `CTAG0.x` | client'ta, bağlantı süresince; aynı kural (`CTAG.x` tanımsızken boş) | `0` |
| `ARGS`, `ARGV[n]`, `ARGV` | fonksiyonun argüman metni, virgülle bölünmüşü, sayısı | |
| `ARGN1-3`, `ARGO`, `ARGS` | tetikleyicinin sayı, nesne ve metin argümanları (anlamı tetikleyiciye göre) | |
| `REF1`..`REFn` | nesne tutucu, fonksiyon başına: `REF1=<NEW.UID>`, sonra `REF1.NAME=...`, `<REF1.P>`; çağrılan fonksiyon görmez | |
| `SRC` | olayı başlatan (çoğunlukla oyuncu, client'ı varsa `SRC.DIALOG`, `SRC.TARGET` de olur) | |
| `ACT`, `ACTARG1-3`, `TARG` | karakterin o anki eylem nesnesi ve argümanları, hedefi | |
| `CONT`, `TOPOBJ`, `LINK`, `MORE1/2`, `MOREP`, `TIMER` | eşyanın kabı, en üst kabı, bağı, serbest alanları, geri sayımı (saniye) | |
| `NEW` | son yaratılan nesne (`SERV.NEWITEM`, `SERV.NEWNPC`, `NEWITEM` sonrası) | |

- Yaratma ve yerleştirme: `SERV.NEWITEM i_gold` + `NEW.AMOUNT=100` + `NEW.P=5400,1100,0,0` (x,y,z,harita) ya da
  `NEW.CONT=<UID>` (karakter UID'si verilirse çantasına; container UID'si verilirse içine). `SERV.NEWNPC c_man` +
  `NEW.P=...`. Yere konmayan nesne bir sonraki save'de silinir. Silme `REMOVE`; `NEW.TIMERF 2,f_ad` 2 saniye sonra
  o nesnenin üstünde `f_ad`'ı çalıştırır (zamanlanmış iş, save'e girer, sunucu kapanıp açılsa da işler).
  `<ISTIMERF.f_ad>` (nokta şart) bekleyen TIMERF'in **kalan süresini ms** verir, yoksa 0; 1/0 değildir.
- Komutu başka bir SRC ile çalıştırmak: `TRYSRC <uid> <komut>` (`REF2.TRYSRC <REF1.UID> TRIGGER @DClick`: eşyanın
  @DClick'i SRC o karakter olarak). `TRY` ve `TRYP` geçersiz nesnede hata vermez. Bayraklar `FLAGADD statf_dead` /
  `FLAGREMOVE statf_dead` (motorun defname'leri `references/engine-defnames.md`).
- Fonksiyon çağrısı: `f_ad a,b,c` (çalışan nesnenin üstünde), `REF1.f_ad` (o nesnenin üstünde; `SRC` aynı kalır),
  `SERV.f_ad`. Değeri `<f_ad a,b>` ya da `<SERV.f_ad>` ile okunur (`RETURN 42` → `42`).
- `+=`, `-=` çalışır (`LOCAL.c += 1`, `TAG0.kills += 1`).
- Tetikleyiciyi elle tetiklemek: `TRIGGER @ad,1,sayı1,sayı2,sayı3` (ARGN olarak) ya da `TRIGGER @ad,2,metin` (ARGS
  olarak); kendi tetikleyici adların `@` ile başlar, `[EVENTS]`'te `ON=@ad` ile yakalanır.
- `EVENTS +e_ad` / `EVENTS -e_ad` nesneye olay kümesi ekler ya da çıkarır; `<EVENTS>` listesi.

## Nesne tanımları

```
[ITEMDEF i_zz_coin]
ID=i_gold
NAME=Zz Coin
TYPE=t_normal
VALUE=5
WEIGHT=1
CATEGORY=Custom
SUBSECTION=Coins
DESCRIPTION=Zz Coin

ON=@Create
COLOR=0481

ON=@DClick
SRC.SYSMESSAGELOC <def.tcolor_green>,3300120,<NAME>
RETURN 1
```

- `ID=` başka bir ITEMDEF ya da art numarası (`0eed`): görüntü ve tiledata oradan; **kalıtım alan alan** (envanteri
  emulatörün `docs/Comparison.md`'sinde): eşyada `NAME`, `TYPE`, `CAN`, `CANUSE`, `LAYER`, `WEIGHT`, `SPEED`, `RANGE`,
  `DAM`/`ARMOR`, `HEIGHT`, `TDATA1-4`, `SOUND` ve bileşen özellikleri gelir; `VALUE`, `RESOURCES`, `SKILLMAKE`,
  `TEVENTS`, `CATEGORY`/`SUBSECTION`/`DESCRIPTION` ve `TAG`'ler gelmez (tanımda yazılan her zaman kazanır). CHARDEF'te
  ek olarak `ICON`, `BLOODCOLOR`, `MAXFOOD`, `FOODTYPE`, `DESIRES`, `ANIM`, `RESOURCES` gelir; `STR`/`DEX`/`INT` ve
  `AVERSIONS` gelmez. `ID=` satırını tetikleyicilerden önce yaz: önceki satırları ezer. Giyilebilir bir tabandan
  (`ID=i_talisman`) türetilen eşya onun `LAYER`'ını da alır; giyilmesin istenirse `LAYER=0`. Numarayla başlıklı
  tanım (`[ITEMDEF 04542]`) bir art'ın kendisidir; özel eşyaya defname başlığı ver. Taban ararken paketin
  defname'lerine bak (`Grep "^\[ITEMDEF i_" itemdefs/`): her art'ın defname'i yoktur (`i_gem` yok, `i_talisman` var).
- `DEFNAME=` eş ad, 56TX'te `DEFNAMES=ad1,ad2` birden çok. `DUPELIST=`, `DUPEITEM=` benzer art'lar.
- `TYPE=t_x` davranış ailesi (`t_potion`, `t_weapon_sword`, `t_container`, `t_food`, `t_light_lit`...; paketin
  `defnames/defs_types_hardcoded.scp`'si ve `typedefs/`); `[TYPEDEF t_x]` o türün ortak tetikleyicileri.
- Bileşen özellikleri (AOS ve sonrası: `HITLEECHLIFE`, `RESFIRE`, `INCREASEDAM`...) tanımda, eşyada ve karakterde aynı adla;
  ini'nin `Feature*` ayarlarına bağlı (`references/keywords.md`, Bileşen özellikleri).
- `[CHARDEF c_x]`: `ID=` (başka CHARDEF ya da gövde numarası), `NAME`, `STR/DEX/INT`, `MAXHITS/MAXMANA/MAXSTAM`,
  `DAM=a,b`, `ARMOR`, `NPC=brain_monster` (56b/T paketlerinde beyin numaraları farklıdır, çevrilir), `TSPEECH=spk_x`,
  `TEVENTS=e_x`, `ITEM=i_x` (giydirilir/çantaya), `CAN=mt_walk|mt_run|mt_equip`, `FOODTYPE`, `DESIRES`, `AVERSIONS`,
  `MOVERATE`, `SHELTER`, `HEIGHT`, `BLOODCOLOR`, skill'ler (`SWORDSMANSHIP=50.0`), `CATEGORY/SUBSECTION/DESCRIPTION`;
  tetikleyiciler (`@NPCSeeNewPlayer`, `@Hit`, `@Death`, `@Speech`...).
- `[EVENTS e_x]` tetikleyici kümesi: karaktere `EVENTS=` ya da `EVENTS +e_x`, eşyaya `TEVENTS` (TYPEDEF gibi); bölgeye
  `EVENTS=`. Ini'nin `EventsChar`, `EventsNpc`, `EventsItem`, `EventsRegion` listeleri herkese verir.
- `[FUNCTION f_x]`: gövde; `.f_x` komutu oyuncu yazabilir (plevel `[PLEVEL n]` listelerinde), `SERV.f_x` sunucudan.
  **Motorun anahtar kelimesiyle aynı adlı fonksiyon yazma:** yüklemede WARNING alır ve motorunkini gölgeler
  (`FunctionOverride=1`); `references/keywords.md`'de olan bir adı seçme.
- `[DIALOG d_x]`: ilk satır `x,y` konum; göstergeler `resizepic`, `gumppic`, `button x y up down 1 0 kod`, `text`,
  `dtext x y renk metin`, `dhtmlgump x y w h bg scroll metin`, `textentry`, `checkbox`, `radio`, `croppedtext`,
  `tilepic`... (tam liste `references/keywords.md`, DIALOG). İçinde IF/FOR çalışır (`<FLAGS>` dialogu açan nesneye
  göre; `SRC` oyuncu). `[DIALOG d_x BUTTON]` bölümünde `ON=kod` (tek) ya da `ON=1 999` aralık, basılan `<ARGN1>`,
  metin kutuları `<ARGTXT[id]>`, işaretler `<ARGCHK[id]>`. `[DIALOG d_x TEXT]` eski biçim metin listesi. Oyuncuya
  `SRC.DIALOG d_x` (ya da `DIALOG d_x` karakterde), kapatmak `DIALOGCLOSE d_x`.
- `[SPEECH spk_x]`: `ON=*kelime*` kalıpları (`ON=*hello*`), gövdede `SRC` konuşan, `<ARGS>` cümle; NPC'ye `TSPEECH` ya da
  `SPEECH +spk_x`. Ini `SpeechNpc` herkese verir. `[TEMPLATE t_x]`: `ITEM=i_x`, `ITEM={i_a 2 i_b 1}`,
  `ITEM=i_x,R3` (3'te 1), `CONTAINER=i_bag`; loot ve vendor envanteri. `[SPAWN spawn_x]`: `ID=c_x` listesi.
  `[AREADEF a_x]`: `GROUP`, `RECT=x1,y1,x2,y2,harita`, `P`, `FLAGS=region_flag_guarded|...`, `EVENTS`, `TAG`.

## Tetikleyiciler

- Yazım `ON=@Ad`, blok sonraki `ON=`'a kadar; `RETURN 1` varsayılanı keser (eşya alınmaz, hasar işlenmez, menü açılmaz...).
  Tam liste ve motorun açıklaması `references/triggers.md`; argümanları motor kaynağında ya da paketteki kullanımda.
- Eşya tetikleyicisi üç yerde yazılabilir: eşyanın `EVENTS`'i, `TYPEDEF`'i, `ITEMDEF`'i (bu sırayla çalışır); karakter
  tarafında aynı olay `@Item...` adıyla (`@ItemDClick`, `@ItemEquip`, `@ItemPickUp_Ground`) gelir, eşyadan sonra.
  Başkasının karaktere yaptığı `@Char...` (`@CharClick`, `@CharAttack`) o karakterde.
- Sık kullanılanlar: eşya `@Create`, `@DClick`, `@Click`, `@Equip`/`@UnEquip`, `@PickUp_*`/`@DropOn_*` (DropOn_Ground
  yeni `P` yazılmadan önce, `ARGS`'ta), `@Step`, `@Timer`, `@Targon_*`, `@ContextMenuRequest/Select`; karakter
  `@Login`/`@Logout`, `@Create`, `@Death`/`@DeathCorpse`, `@Hit`/`@GetHit`/`@HitTry`/`@HitMiss`, `@Attack`,
  `@SpellCast`/`@SpellEffect`, `@SkillStart`/`@SkillSuccess`/`@SkillFail`, `@Speech`, `@Step`, `@NPCSeeNewPlayer`,
  `@NPCAcceptItem`, `@Kill`, `@ExpChange`, `@StatChange`, `@UserExWalkLimit`...; bölge `@Enter`, `@Exit`, `@Step`.
- Sunucu olayları `[FUNCTION f_on...]` (`f_onserver_start`, `f_onchar_create`, `f_onaccount_login`...): tanımlıysa
  çalışır; `references/serv-functions.md`.
- Tetikleyicinin `LOCAL`'ları o tetikleyiciye özeldir; bazıları yazılabilir ve motora döner (ör. `@Hit`'te `ARGN1`
  hasar). Sayıları hex yazdırmadan karşılaştır; oyuncuya `<dARGN1>`.

## 56TX'e özgü

- **Mesajlar cliloc numarasıyla.** Paket düz metin göndermez: `SRC.SYSMESSAGELOC <def.tcolor_red>,3300042[,arg1,arg2]`;
  üstte konuşma `MESSAGELOC renk,numara,...`, `SAYLOC`, `EMOTELOC`. Metnin `~1_VAL~`...`~N_VAL~` yerlerine argümanlar
  sırayla girer. Yeni mesaj gerekiyorsa numarayı sunucu verir: konsolda ya da script'te
  `SERV.CLILOCADD pack,<İngilizce metin>|<Türkçe metin>` (3.300.000-3.499.999 aralığı; emulatörünki `emulator`);
  dönen numara script'e yazılır, metin Cliloc.enu ve Cliloc.trk'ye işlenmiş olur. Mevcut metni bulmak `<SERV.CLILOCFIND
  metin>`, okumak `<CLILOCTEXT.tr.3300042>`. Argümanı olan mesajı iki dilde aynı sayıda argümanla yaz.
- **Gömülü yardımcılar** (`[FUNCTION]` yazmadan): `<ISBLANK>`, `STR*` ailesi, `<NUMBERFORMAT sayı>`, tarih ve süre
  (`<DATEFORMAT>`, `<DATEDIFFFORHUMANS>`, `<DURATIONFORHUMANS saniye>` "10 minutes"/"10 dakika", çalışan kodun
  dilinde; seçenekleri kaynakta `DateTimeHelpers`), `<VALIDATE kurallar,değer>`, dizi (`<ARRAYCOUNT>`...),
  `MAX`/`MIN`/`PERCENT`; karakterde `HITSADD/HITSREMOVE`, `MANAADD`, `STAMADD`, `STATSADD`, `FLAGADD/FLAGREMOVE`,
  `NOMOVE`, `UNEQUIPALL`, `PACKDELETE`, `WARMODEADD`, `STAFFSETUP`; eşyada `ISINPACK`, `PACKCOUNT`, `COOLDOWN`.
  Paketin aynı adlı eski `[FUNCTION]`'ı varsa motor uyarır ve script kazanır; yeni script motorunkini kullanır.
- **Sistemler motorda:** bonuslar (`[BONUS b_x]`, silahta `BONUSES=`), loot veritabanı (`LOOTADD`, `.loot`), aile
  (`FAMILYCREATE`, `<FAMILY>`), ticket ve ihbar (`TICKETNEW`, `REPORTNEW`), kelime filtresi (`[WORDFILTER]`), hesap
  pin'i (`.pin`), kervan (`t_multi_movable`), `.STAT`, `.MAKELAST`, `.MTELE`, Discord (`SERV.DISCORD.*`). Bunların
  paketteki karşılığı çoğunlukla sadece dialog ve konuşma komutudur; kuralı yeniden yazma, motorunkini çağır.
- **Ayara bağlı davranış:** 56b/T ile X'in ayrıldığı her kural bir ini ayarıdır (`0` = 56b/T, `1` = X):
  `CombatSwingTiming`, `DistanceTouch`, `RecallRuneWear`, `StealthStepMode`... Script bir ayara göre dallanacaksa
  `<SERV.Ayar>` okur; anlamları `references/ini-settings.md`.
- **Sürüm (lehçe):** paket 56TX lehçesidir (`ScriptDialect` ayarı yok ya da `56TX`): X'in anlamları geçerli (QVAL `:`
  ayracı parantez içinde atlanır, `IF` tembel, geçersiz `REF` okuması hata, `DEF` resource adını bulmaz, beyin
  numaraları X'in). 0.56b/T paketleri `ScriptDialect=56T` ile çalışır; onlar için yazarken emulatörün
  `docs/Comparison.md` ve `docs/EnumCompat.md`'sine bak.
- `TAG.CREATEDAT` yerine `<CREATEDAT>`, `NOSLEEP=1` sektörü uyanık tutar, `STATTOTAL`, `FORALLITEMS`, `CLOSECONTAINER`,
  `ISNEARTYPE` (virgüllü argümanlar) 56T'den ve X PR'larından alınmış anahtar kelimeler; hepsi `references/keywords.md`'de.

## Doğrulama

Yazdığın script'i exe'yle yüklemeden iş bitmez. İki seviye:

1. **Yüklenme:** sunucu açılırken script hatasız okunmalı. Log'da (`logs/sphereYYYY-MM-DD.log`) kendi dosyanın adını
   geçiren `ERROR:` ve `WARNING:` satırlarını ara ("Undefined keyword", "Can't resolve", "Undefined symbol",
   "defined again", "Replacing existing"). Paketin kendi eski hataları seninkilerle karışmasın: dosya adına bak.
2. **Mantık:** `[FUNCTION f_onserver_start]` içinden senaryoyu kur ve sonuçları `SERV.LOG TEST|ad|alınan|beklenen`
   satırlarıyla yaz; sonda `SERV.LOG TEST_done`. `references/syntax-verified.scp` bunun örneğidir: NPC ve eşya
   yaratır (`SERV.NEWNPC`, `P=5400,1100,0,0` Green Acres), nesnenin üstünde fonksiyon çalıştırır (`REF1.f_x`),
   zamanlayıcıyı `TIMERF` ile sınar. Oyuncunun yerine bir NPC kullan: `REF2.TRYSRC <REF1.UID> TRIGGER @DClick`
   eşyanın @DClick'ini SRC o NPC olarak çalıştırır; ölü senaryo `REF1.FLAGADD statf_dead`; uzun süreleri bir
   `DEF` ya da eşyanın `TAG`'inden okut ki test kısaltabilsin; bekleyen zamanlayıcı `<ISTIMERF.f_ad>` (kalan ms).
   NPC'ye giden `SYSMESSAGELOC`/`MESSAGELOC` sessizce yutulur: mesajın görünmesi, dialog ve hedefleme client ister;
   onları yüklenme kontrolünden geçirip kullanıcıya oyunda denemesini söyle. Yeni cliloc numarası alamadığın yerde
   geçici numara kullanma eğilimine dikkat: 3300000'den sonraki numaralar dolu olabilir, gerçek numarayı
   `SERV.CLILOCADD` verir; raporunda eklenecek metinleri listele.

Emulatör checkout'u yanındaysa en kolayı onun koşucusu; yalıtılmış klasörde paketin git'teki hâlini ve test ini'sini
kurar, sunucuyu açar, `TEST|` satırlarını karşılaştırır, çökmeyi yakalar (test dosyan paketin dışında bir klasörde,
`zz_test.scp` adıyla; başka bir sunucunun portunu seçme):

```powershell
& <emulatör>\tests\run-suite.ps1 -Suite <takım> -SuitesDir <takımların klasörü> -Label <ad> -Port 4931 `
    -OutRoot build\skilltest -TestFolder zz_test -Exe <emulatör>\build\vs\bin\Nightly\SphereSvrTX64_nightly.exe
```

Paketin commit'lenmemiş dosyalarını da sınamak için `-Pack <paket klasörü>` yerine `git stash`'siz yol: koşucu `git
archive HEAD` kullanır, önce commit'le ya da dosyayı test klasörüne de kopyala. Emulatör yoksa: paketin kopyasını
boş bir klasöre al, sunucunun `sphere.ini`'sini kopyalayıp `ScpFiles`, `WorldSave`, `AcctFiles`, `Log` yollarını o
klasöre, `ServPort`'u boş bir porta çevir, exe'yi `-J` ile aç, log'u oku, süreci kapat. Kullanıcının çalışan
sunucusunu ve `run/` klasörünü test için kullanma.

Bitirmeden kontrol listesi: dosya doğru klasörde ve `[RESOURCES]`'ta; `[EOF]` var; yorumlar ayrı satırda; her `IF`'in
`ENDIF`'i, her döngünün `ENDFOR`/`ENDWHILE`/`ENDDO`'su var; metin karşılaştırmaları `STRCMP`/`STRMATCH`; oyuncuya giden
sayılar `<d...>`; mesajlar cliloc numarasıyla, iki dilde eklendi; motor adıyla çakışan `[FUNCTION]` yok; log'da
dosyana ait hata yok; test satırları beklendiği gibi.

## Sık tuzaklar (ölçülmüş)

- `IF (<NAME> == Ali)` her zaman doğru çıkar (iki ad da tanımsız, 0 == 0). `STRCMP` kullan.
- `LOCAL.x=1` sonra `<LOCAL.x>` `01` yazar; oyuncuya `<dLOCAL.x>`.
- `010` on altıdır; ondalık 10 için `10`.
- Tag'i hep `TAG0` ile yaz ve oku. Hiç set edilmemiş `TAG.x` koşulda ve hesapta boş işlenen bırakır:
  `IF (<TAG.x> == 1)` "Undefined symbol ''" verir, `== 0` doğru ve `== 1` yanlış çıkar, `<EVAL <TAG.x>+1>` 0 olur;
  `TAG0.x` 0 verir ve hepsi doğru çalışır. `TAG0.x=0` tag'i siler, `TAG.x=0` saklar.
- Tanımsız `LOCAL` `0`; `ISEMPTY` tanımsız LOCAL'de 0 verir, `ISBLANK` 1.
- `{a b}` iki değerli küme aralıktır, ağırlıklı seçim için en az `{a 1 b 1}`.
- `<QVAL c ? a : b>` ilk dalı `"a "` (boşluklu) döndürür; `? a:b` yaz.
- `DOSWITCH` 0'dan sayar.
- `//` tırnak içinde de yorum başlatır; URL'ler (`://`) hariç.
- Yere ya da bir kaba konmayan yeni nesne save'de silinir ("unplaced object"); `P=` ya da `CONT=` ver.
- Aynı yığılabilir eşyadan iki tane bir kaba konunca tek yığın olur; sayarken `AMOUNT`'a bak.
- `FORCHARS` kendini de sayar; `IF (<UID> != <VAR.self>)` ile ayır (`REF`'ler çağrılan fonksiyona geçmez, `VAR` ya da
  `ARGS` kullan).
- `SERV.NEWNPC` ile yaratılan NPC'nin çantası yoktur; eşyayı `NEW.CONT=<npc uid>` ile ver, çanta o anda açılır.
- Satırda düz `<` `>`, kapanmamış parantez ve köşeli parantez ayrıştırıcıyı bozar.
- Motorun anahtar kelimesiyle aynı adlı `[FUNCTION]` (`DISTANCE`, `ISPLAYER`...) uyarı alır ve motorunkini gölgeler.
