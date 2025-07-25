class Rpmdevtools < Formula
  include Language::Python::Virtualenv
  include Language::Python::Shebang

  desc "RPM development tools"
  homepage "https://pagure.io/rpmdevtools"
  url "https://releases.pagure.org/rpmdevtools/rpmdevtools-9.6.tar.xz"
  sha256 "794c97afeb6e81867497b84d2ecfd42dc8c984f59fbab8282f5396419ca7cb9e"
  license "GPL-2.0-or-later"

  head "https://pagure.io/rpmdevtools.git", branch: "main"

  depends_on "help2man"
  depends_on "python@3.13"
  depends_on "rpm"

  resource "progressbar2" do
    url "https://files.pythonhosted.org/packages/19/24/3587e795fc590611434e4bcb9fbe0c3dddb5754ce1a20edfd86c587c0004/progressbar2-4.5.0.tar.gz"
    sha256 "6662cb624886ed31eb94daf61e27583b5144ebc7383a17bae076f8f4f59088fb"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8/requests-2.32.4.tar.gz"
    sha256 "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc/urllib3-2.5.0.tar.gz"
    sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/73/f7/f14b46d4bcd21092d7d3ccef689615220d8a08fb25e564b65d20738e672e/certifi-2025.6.15.tar.gz"
    sha256 "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e4/33/89c2ced2b67d1c2a61c19c6751aa8902d46ce3dacb23600a283619f5a12d/charset_normalizer-3.4.2.tar.gz"
    sha256 "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
  end

  resource "python-utils" do
    url "https://files.pythonhosted.org/packages/13/4c/ef8b7b1046d65c1f18ca31e5235c7d6627ca2b3f389ab1d44a74d22f5cc9/python_utils-3.9.1.tar.gz"
    sha256 "eb574b4292415eb230f094cbf50ab5ef36e3579b8f09e9f2ba74af70891449a0"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/d1/bc/51647cd02527e87d05cb083ccc402f93e441606ff1f01739a62c8ad09ba5/typing_extensions-4.14.0.tar.gz"
    sha256 "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
  end

  patch :DATA

  def install
    # Install all Python dependencies in a virtualenv.
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install resources

    system "./configure", "--disable-silent-rules", *std_configure_args

    # Replace shebang with path to the python interpreter in the virtual environment.
    rewrite_shebang python_shebang_rewrite_info("#{libexec}/bin/python"), *%w[
      rpmdev-bumpspec
      rpmdev-rmdevelrpms.py
      rpmdev-sort
      rpmdev-vercmp
      rpmdev-checksig
      rpmdev-spectool
    ]

    system "make", "install"
  end

  test do
    %w[
      rpmdev-bumpspec
      rpmdev-rmdevelrpms
      rpmdev-spectool
    ].each do |bin|
      system bin, "--version"
    end
  end
end

__END__
diff --git Makefile.in Makefile.in
index b01bc87..2e60bbe 100644
--- Makefile.in
+++ Makefile.in
@@ -1041,13 +1041,13 @@ all: $(bin_SCRIPTS) $(man1_MANS) $(man8_MANS) $(bashcomp_DATA)
	chmod +x $@

 rpmdev-spectool.1: rpmdev-spectool
-	COLUMNS=1000 $(HELP2MAN) -s 1 -N -h -h -v --version $(<D)/$(<F) -o $@
+	COLUMNS=1000 $(HELP2MAN) --no-discard-stderr -s 1 -N -h -h -v --version $(<D)/$(<F) -o $@

 %.1: %
-	PATH="$(<D):$$PATH" COLUMNS=1000 $(HELP2MAN) -s 1 -N -h -h -v -v $(<F) -o $@
+	PATH="$(<D):$$PATH" COLUMNS=1000 $(HELP2MAN) --no-discard-stderr -s 1 -N -h -h -v -v $(<F) -o $@

 %.8: %
-	COLUMNS=1000 $(HELP2MAN) -s 8 -N $(<D)/$(<F) -o $@
+	COLUMNS=1000 $(HELP2MAN) --no-discard-stderr -s 8 -N $(<D)/$(<F) -o $@

 install-exec-hook:
	cd $(DESTDIR)$(bindir) && \
