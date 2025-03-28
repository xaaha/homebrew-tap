class Hulak < Formula
  desc 'File Based API client for terminal nerds'
  homepage 'https://github.com/xaaha/hulak'
  url 'https://github.com/xaaha/hulak/archive/refs/tags/v0.1.0-beta.3.tar.gz'
  sha256 '5252c9451a63cb4c681c794d11f182036f4e19e3b2797d8de395de83f76e5a8f'
  # Beta release
  version '0.1.0-beta.3'
  license 'MIT'
  head 'https://github.com/xaaha/hulak.git', branch: 'main'

  depends_on 'go' => :build

  def install
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
    man1.install 'man/hulak.1'
  end

  test do
    assert_match 'Api Usage:', shell_output("#{bin}/hulak help")
    system bin / 'hulak', 'init'
    assert_predicate testpath / 'env' / 'global.env', :exist?
  end
end
