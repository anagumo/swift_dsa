protocol TipCalculatorContract {
    func open()
    func calcTotalAmount(_ billAmount: Double, tip: Double) -> Double
    func calcTip(_ tip: Double, billAmount: Double) -> Double
}

final class TipCalculatorController: TipCalculatorContract {
    private var inputBillAmount: Double?
    private var inputTip: Double?
    
    init() {
        inputBillAmount = nil
        inputTip = nil
    }
    
    func open() {
        while inputBillAmount == nil  && inputTip == nil {
            print("What is the bill? ")
            inputBillAmount = Double(readLine() ?? "")
            print("What is the tip %? ")
            inputTip = Double(readLine() ?? "")
            
            let tip = calcTip(inputTip ?? 0, billAmount: inputBillAmount ?? 0)
            let totalAmount = calcTotalAmount(inputBillAmount ?? 0, tip: inputTip ?? 0)
            print("The tip is: $\(tip)")
            print("The total is: $\(totalAmount)")
        }
    }
    
    func calcTotalAmount(_ billAmount: Double, tip: Double) -> Double {
        billAmount + calcTip(tip, billAmount: billAmount)
    }
    
    func calcTip(_ tip: Double, billAmount: Double) -> Double {
        billAmount * (tip / 100)
    }
}
