class Hulak < Formula
  desc 'File Based API client for terminal nerds'
  homepage 'https://github.com/xaaha/hulak'
  url 'https://github.com/xaaha/hulak/archive/refs/tags/v0.1.2.tar.gz'
  sha256 '04f8e852bc34821a265a83175555477d41fc37fcc2b8541707feaa4e685345f6'
  version '0.1.2'
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
