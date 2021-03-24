cask 'scalar-azrepos' do
  version '21.03.185.1'
  sha256 '3ef1d2ec656bf3ff48a0cab4d699e681f3f61b752ddf3a7a9017a8c0c42a2e6b'

  url "https://github.com/microsoft/scalar/releases/download/v#{version}/Installers_macOS_Release.zip"

  name 'Scalar for Azure Repos'
  homepage 'https://github.com/microsoft/scalar'

  pkg "Installers_macOS_Release/Scalar/Scalar.#{version}.pkg", allow_untrusted: true

  conflicts_with cask: 'scalar'

  depends_on cask: 'microsoft-git'
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
                      executable: '/usr/local/scalar/uninstall_scalar.sh',
                      sudo:       true,
                    },
            pkgutil: 'com.scalar.pkg'
end
