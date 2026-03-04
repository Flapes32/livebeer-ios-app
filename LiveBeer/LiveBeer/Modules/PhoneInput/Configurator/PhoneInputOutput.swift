protocol PhoneInputOutput: AnyObject {
    func phoneInputDidTapBack()
    func phoneInputDidSucceed(phone: String)
    func phoneInputDidTapRegistration(phone: String)
}
