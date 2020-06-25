cask 'scalar' do
  version '20.06.171.1'
  sha256 '6099aed26b0eb7d7abb77feb99dfd77525d8ae11ad5179fa174751f4ba63ef2c'

  url "https://github.com/microsoft/scalar/releases/download/v#{version}/Installers_macOS_Release.zip"

  name 'Scalar'
  homepage 'https://github.com/microsoft/scalar'

  pkg "Installers_macOS_Release/Scalar/Scalar.#{version}.pkg", allow_untrusted: true

  conflicts_with cask: 'scalar-azrepos'

  depends_on formula: 'git'
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
                      executable: '/usr/local/scalar/uninstall_scalar.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.scalar.pkg'
end
