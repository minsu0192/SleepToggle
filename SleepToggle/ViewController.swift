import Cocoa

class PopoverViewController: NSViewController {

    weak var appDelegate: AppDelegate?

    let containerView = NSView()
    let labelField = NSTextField(labelWithString: "")
    let descField = NSTextField(labelWithString: "")
    let toggleSwitch = NSSwitch()
    let statusLabel = NSTextField(labelWithString: "")
    let langButton = NSButton()
    let quitButton = NSButton()

    let langContainerView = NSView()
    let backButton = NSButton()
    var langButtons: [NSButton] = []

    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 260, height: 170))
        view.wantsLayer = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupLangView()
        updateUI()
    }

    func setupMainView() {
        containerView.frame = view.bounds
        view.addSubview(containerView)

        labelField.font = NSFont.boldSystemFont(ofSize: 13)
        labelField.frame = NSRect(x: 20, y: 128, width: 160, height: 20)
        containerView.addSubview(labelField)

        toggleSwitch.frame = NSRect(x: 200, y: 126, width: 50, height: 24)
        toggleSwitch.target = self
        toggleSwitch.action = #selector(toggleSleep)
        containerView.addSubview(toggleSwitch)

        descField.font = NSFont.systemFont(ofSize: 11)
        descField.textColor = .secondaryLabelColor
        descField.maximumNumberOfLines = 2
        descField.frame = NSRect(x: 20, y: 88, width: 220, height: 36)
        containerView.addSubview(descField)

        statusLabel.font = NSFont.boldSystemFont(ofSize: 11)
        statusLabel.frame = NSRect(x: 20, y: 68, width: 220, height: 16)
        containerView.addSubview(statusLabel)

        let divider = NSBox()
        divider.boxType = .separator
        divider.frame = NSRect(x: 0, y: 55, width: 260, height: 1)
        containerView.addSubview(divider)

        langButton.frame = NSRect(x: 20, y: 16, width: 100, height: 28)
        langButton.bezelStyle = .rounded
        langButton.target = self
        langButton.action = #selector(showLang)
        containerView.addSubview(langButton)

        quitButton.frame = NSRect(x: 180, y: 16, width: 60, height: 28)
        quitButton.bezelStyle = .rounded
        quitButton.target = self
        quitButton.action = #selector(quitApp)
        containerView.addSubview(quitButton)
    }

    func setupLangView() {
        langContainerView.frame = view.bounds
        langContainerView.isHidden = true
        view.addSubview(langContainerView)

        backButton.frame = NSRect(x: 20, y: 128, width: 80, height: 26)
        backButton.bezelStyle = .rounded
        backButton.title = "← Back"
        backButton.target = self
        backButton.action = #selector(hideLang)
        langContainerView.addSubview(backButton)

        let langList: [(String, String)] = [
            ("en", "English"), ("ko", "한국어"), ("ja", "日本語"),
            ("zh-hans", "简体中文"), ("zh-hant", "繁體中文")
        ]
        for (i, (code, name)) in langList.enumerated() {
            let btn = NSButton()
            btn.title = name
            btn.bezelStyle = .rounded
            btn.frame = NSRect(x: 20, y: 88 - i * 30, width: 220, height: 26)
            btn.identifier = NSUserInterfaceItemIdentifier(code)
            btn.target = self
            btn.action = #selector(selectLang(_:))
            langContainerView.addSubview(btn)
            langButtons.append(btn)
        }
    }

    func updateUI() {
        guard let d = appDelegate else { return }
        labelField.stringValue = d.t("label")
        descField.stringValue = d.isOn ? d.t("descOn") : d.t("descOff")
        statusLabel.stringValue = d.isOn ? "● \(d.t("on"))" : "○ \(d.t("off"))"
        statusLabel.textColor = d.isOn ? .systemGreen : .secondaryLabelColor
        toggleSwitch.state = d.isOn ? .on : .off
        langButton.title = d.t("lang")
        quitButton.title = d.t("quit")
    }

    @objc func toggleSleep() {
        guard let d = appDelegate else { return }
        d.isOn = toggleSwitch.state == .on
        let task = Process()
        task.launchPath = "/usr/bin/sudo"
        task.arguments = ["/usr/bin/pmset", "-a", "disablesleep", d.isOn ? "1" : "0"]
        task.launch()
        task.waitUntilExit()
        d.updateIcon()
        updateUI()
    }

    @objc func showLang() {
        containerView.isHidden = true
        langContainerView.isHidden = false
    }

    @objc func hideLang() {
        langContainerView.isHidden = true
        containerView.isHidden = false
        updateUI()
    }

    @objc func selectLang(_ sender: NSButton) {
        appDelegate?.currentLang = sender.identifier?.rawValue ?? "en"
        hideLang()
    }

    @objc func quitApp() {
        NSApp.terminate(nil)
    }
}
