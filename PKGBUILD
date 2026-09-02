pkgname=9router-local
pkgver=${PKGVER:-0.5.59}
pkgrel=1
pkgdesc='Local AI routing gateway and dashboard'
arch=('x86_64')
url='https://github.com/CoolLoong/9router'
license=('MIT')
depends=('nodejs')
options=('!strip')

package() {
  local app_dir="${startdir}/cli/app"
  local cli_dir="${startdir}/cli"
  local install_dir="${pkgdir}/opt/9router"

  install -d "${install_dir}/app" "${install_dir}/node_modules" "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/systemd/user"
  cp -a "${app_dir}/." "${install_dir}/app/"
  install -Dm755 "${cli_dir}/cli.js" "${install_dir}/cli.js"
  install -Dm644 "${cli_dir}/package.json" "${install_dir}/package.json"
  cp -a "${cli_dir}/hooks" "${install_dir}/hooks"
  cp -a "${cli_dir}/src" "${install_dir}/src"
  for dependency in enquirer node-forge node-machine-id ansi-colors strip-ansi ansi-regex; do
    cp -a "${cli_dir}/node_modules/${dependency}" "${install_dir}/node_modules/"
  done
  ln -s /opt/9router/cli.js "${pkgdir}/usr/bin/9router"
  install -Dm644 "${startdir}/.config/9router.service" "${pkgdir}/usr/lib/systemd/user/9router.service"
}
