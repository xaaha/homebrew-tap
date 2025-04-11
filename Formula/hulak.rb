class Hulak < Formula
  desc 'File Based API client for terminal nerds'
  homepage 'https://github.com/xaaha/hulak'
  url 'https://github.com/xaaha/hulak/archive/refs/tags/v0.1.0.tar.gz'
  sha256 '97593227b8fe760e55e1c0c689c9871a4ca2a64fb8d29c48b7eedf05b7f460e2'
  version '0.1.0'
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
