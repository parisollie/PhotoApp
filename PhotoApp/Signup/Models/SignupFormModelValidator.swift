import Foundation

//Paso 1.4
class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    //Paso 1.5
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        //Paso 1.12, usamos el archivo de constantes
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
 
   /* func isFirstNameValid(firstName: String) -> Bool {
            var returnValue = true
            
            if firstName.isEmpty {
                returnValue = false
            }
            
            return returnValue
    }*/

    //Paso 1.15
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        //Paso 1.17
        return password == repeatPassword
    }
    
    
    
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
       return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLength ||
        password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    
    
}
