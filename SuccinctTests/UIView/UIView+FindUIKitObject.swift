import XCTest
import Quick
import Nimble
@testable import Succinct

class UIView_FindUIKitObjectSpec: QuickSpec {
    override func spec() {
        describe("finding buttons") {
            context("when a button exists in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIButtonBuilder().withTitleText("Login").build())
                        .build()


                    let result = viewController.view.findButton(withText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }

            context("when a button exists in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UIButtonBuilder().withTitleText("Login").build()
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.view.findButton(withText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }
        }
    }
}
