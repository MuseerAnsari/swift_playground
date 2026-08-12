import Foundation

final class LoginViewController: LoginViewDelegate {

    private let viewModel: LoginViewMoel
    
    init(viewModel: LoginViewMoel) {
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    func getUserName() -> String {
        return "museer"
    }

    func tapLoginButton() {
        // When 'tapLoginButton' called check if username is valid in ViewModel and pass the validation status back.
        viewModel.validateUserName()
        print(viewModel.isUserNameValid)
    }
    
}

protocol LoginViewDelegate: AnyObject {
    func getUserName() -> String
}


final class LoginViewMoel {

    weak var delegate: LoginViewDelegate?
    var isUserNameValid = false
    
    func validateUserName() {
        // 1: Get userName from `LoginViewController`
        // 2: Validate the userName if not empty let 'ViewController' know that it valid unsername
        let name = delegate?.getUserName() ?? ""
        isUserNameValid = validateName(name)
        
    }
    
    private func validateName(_ name: String) -> Bool {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
        if name.count > 10 {
            return true
        }
        return false
    }
    
}

let viewModel = LoginViewMoel()
let loginVC = LoginViewController(viewModel: viewModel)
loginVC.tapLoginButton()

