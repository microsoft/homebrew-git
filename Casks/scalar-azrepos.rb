cask 'scalar-azrepos' do
  version '20.07.174.1'
  sha256 'd6545b51ad6ef7c407f894230027bffd253d595e5d0fee0a290ddad4f7ceef97'

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
