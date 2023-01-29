pkgname=zxnimage
pkgver=2.00.02
pkgrel=1
arch=('x86_64')
url=https://github.com/varmfskii/zxnimage
pkgdesc='zxntools are a set of image tools to convert to and from ZX Spectrum Next image formats'
license=('GPL')
depends=('netpbm>=10.0.0')
source=("zxnimage::git+https://github.com/varmfskii/zxnimage")
md5sums=('SKIP')

pkgver() {
    grep -i "Version [0-9]" "$srcdir/$pkgname/README.md" | sed -e 's/^.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*.*\).*$/\1/'
}

build() {
    cd "$srcdir/$pkgname"
    make PAMPREFIX=1 -C libzxntools
    make PAMPREFIX=1
}

package() {
    cd "$srcdir/$pkgname"
    make PAMPREFIX=1 PREFIX="$pkgdir" install
}


