import Testing

struct TipCalculatorTesting {
    let sut: TipCalculatorContract
    
    init() {
        sut = TipCalculatorController()
    }
    
    @Test func test_calc_tip() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let result = sut.calcTip(15, billAmount: 200)
        #expect(result == 30, "Result expected: 1.50")
    }
    
    @Test func test_calc_total_amount() async throws {
        let result = sut.calcTotalAmount(200, tip: 15)
        #expect(result == 230, "Result expected: 11.50")
    }
}
