protocol AppContract {
    func run()
}

final class App: AppContract {
    private let tipCalculatorController: TipCalculatorContract
    
    init() {
        self.tipCalculatorController = TipCalculatorController()
    }
    
    func run() {
        tipCalculatorController.open()
    }
}
