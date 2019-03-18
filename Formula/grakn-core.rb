class GraknCore < Formula
  desc "Grakn Core: The Knowledge Graph"
  homepage "https://grakn.ai"
  url "https://github.com/lolski/grakn/releases/download/v1.5.0-SNAPSHOT/grakn-core-all-mac-1.5.0-SNAPSHOT.zip"
  sha256 "3d7cd903a53161256bff16fdd7cc6bf7be536a1c6daa081a84512441fecaa60c"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"grakn"
    bin.env_script_all_files(libexec, Language::Java.java_home_env("1.8"))
  end

  test do
    assert_match /RUNNING/i, shell_output("#{bin}/grakn server status")
  end
end