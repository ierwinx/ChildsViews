import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vistaSobreescribir: UIView!
    
    private lazy var arrViews = [Vista1ViewController(), Vista2ViewController()]
    private var iView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showView(view: 0)
    }
    
    @IBAction func changeAction(_ sender: UISegmentedControl) {
        removeView(view: iView)
        iView = sender.selectedSegmentIndex
        showView(view: iView)
    }
    
    private func showView(view: Int) {
        let vista = arrViews[view]
        vista.view.frame = CGRect(x: 0, y: 0, width: vistaSobreescribir.frame.width, height: vistaSobreescribir.frame.height)
        vistaSobreescribir.addSubview(vista.view)
        addChild(vista)
        vista.didMove(toParent: self)
    }
    
    private func removeView(view: Int) {
        let vista = arrViews[view]
        vista.willMove(toParent: nil)
        vista.removeFromParent()
        vista.view.removeFromSuperview()
    }
    
}
