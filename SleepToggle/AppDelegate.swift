import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem!
    var popover: NSPopover!
    var isOn = false
    var currentLang = "en"

    let strings: [String: [String: String]] = [
        "en": ["label": "Keep Music Playing", "descOn": "Music continues even\nwhen lid is closed", "descOff": "Music will stop\nwhen lid is closed", "on": "ON", "off": "OFF", "quit": "Quit", "lang": "Language"],
        "ko": ["label": "음악 재생 유지", "descOn": "덮개를 닫아도\n음악이 재생됩니다", "descOff": "덮개를 닫으면\n음악이 멈춥니다", "on": "ON", "off": "OFF", "quit": "종료", "lang": "언어"],
        "ja": ["label": "音楽再生を維持", "descOn": "蓋を閉じても\n音楽が再生されます", "descOff": "蓋を閉じると\n音楽が停止します", "on": "ON", "off": "OFF", "quit": "終了", "lang": "言語"],
        "zh-hans": ["label": "保持音乐播放", "descOn": "关闭盖子后\n音乐仍会继续播放", "descOff": "关闭盖子后\n音乐将会停止", "on": "ON", "off": "OFF", "quit": "退出", "lang": "语言"],
        "zh-hant": ["label": "保持音樂播放", "descOn": "關閉蓋子後\n音樂仍會繼續播放", "descOff": "關閉蓋子後\n音樂將會停止", "on": "ON", "off": "OFF", "quit": "結束", "lang": "語言"]
    ]

    func t(_ key: String) -> String {
        return strings[currentLang]?[key] ?? strings["en"]![key]!
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            button.title = "♩"
            button.action = #selector(togglePopover)
            button.target = self
        }
        let vc = PopoverViewController()
        vc.appDelegate = self
        popover = NSPopover()
        popover.contentSize = NSSize(width: 260, height: 170)
        popover.behavior = .transient
        popover.contentViewController = vc
    }

    @objc func togglePopover() {
        guard let button = statusItem.button else { return }
        if popover.isShown {
            popover.performClose(nil)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }

    func updateIcon() {
        statusItem.button?.title = isOn ? "♪" : "♩"
    }
}
