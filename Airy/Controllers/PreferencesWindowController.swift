import Cocoa

class PreferencesWindowController: NSWindowController, NSWindowDelegate {
  
  override func windowDidLoad() {
    super.windowDidLoad()
  }
  
  @IBOutlet weak var prefViewCon: PreferencesViewController!
  
  override func keyDown(with event: NSEvent) {
    super.keyDown(with: event)
    if let vc = prefViewCon {
      if vc.listening {
        vc.updateGlobalShortcut(event)
      }
    }
  }
  
  @IBAction func escapeAction(_ sender: NSButton) {
    NSApplication.shared.hide(sender)
  }
  
  override func showWindow(_ sender: Any?) {
    let mouseLocation = NSEvent.mouseLocation
    let windowSize = window?.frame
    let windowLocation = NSPoint(x: mouseLocation.x - windowSize!.width / 2, y: mouseLocation.y - windowSize!.height / 2)
    
    if !window!.isMainWindow {
      window?.setFrameOrigin(windowLocation)
    }
    NSApplication.shared.activate(ignoringOtherApps: true)
    window?.makeKeyAndOrderFront(self)
    window?.makeKey()
  }
}
