cask "font-SAP-72-Mono" do
    version "1.10"
    sha256 :no_check
  
    url "https://experience.sap.com/fiori-design-web/wp-content/uploads/sites/5/2021/04/72Mono_desktop.zip"
    name "SAP Font 72 Mono"
    desc "Font 72 is SAP’s proprietary typeface and is the standard typeface for SAP Fiori apps"
    homepage "https://experience.sap.com/fiori-design-web/downloads/#download-font-72"
  
    font "72Mono_desktop/72Mono-Bold.ttf"
    font "72Mono_desktop/72Mono-Regular.ttf"
  end