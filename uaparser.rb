VERSION = '0.0.1'.freeze

# uaparser
class Uaparser < Formula
  homepage 'https://github.com/mitakeck/uaparser'
  url 'https://github.com/mitakeck/uaparser.git', tag: "v#{VERSION}"
  version VERSION
  head 'https://github.com/mitakeck/uaparser.git', branch: 'master'

  depends_on 'go' => :build
  depends_on 'hg' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/mssola/user_agent'
    mkdir_p buildpath / 'src/github.com/mitakeck/uaparser'
    ln_s buildpath / 'search', buildpath / 'src/github.com/mitakeck/uaparser/.'
    system 'go', 'build', '-o', 'uaparser'
    bin.install 'uaparser'
  end
end
