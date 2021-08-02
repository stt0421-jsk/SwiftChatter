// Non AI Swift Chatbot
// Developed by Joonsung Kim
// Version: 0.0.2
// Development Started: July 30th 2021
// Latest version: July 31st 2021
// Refer to swiftchatter_log.txt for development log

// This project was originaly meant to be developed with Python
// However, due to limitations in functions
// and not much experience,
// the project has changed its development language to Swift

import Foundation
import Darwin

let command_input_list = ["weather", "time", "calc", "help", "quit", "exit", "calculator"]

let yes_list = ["y", "Y", "Yes", "yes", "yeah", "sure", "yep", "yup", "ok", "okay", "k", "Okay", "dd", "ya"]
let no_list = ["n", "N", "No", "no", "nope", "not really", "Nope", "Not really", "nah", "Nah", "ss"]

let me_list = ["me", "i", "I", "Me", "I'll", "I'd", "I've", "I'm"]
let you_list = ["you", "You", "Chatbot", "chatbot", "thee", "thy", "tu", "you'd", "you've", "You'd", "You've", "You're", "you're", "your", "Your"]
let he_list = ["he", "his", "He", "His", "He's", "He've", "He'd", "she", "her", "She", "Her", "she's", "she've", "she'd", "they", "their", "They", "Their", "They're", "They've", "They'd"]
let be_list = ["am", "are", "is", "was", "were", "be", "been"]
let article_list = ["a", "the", "an"]
let have_list = ["have", "has"]
let had_list = ["had"]

// Main APP

print("***************************************")
print("     Non AI Swift Chatbot")
print("     -- version 0.0.2 variant Swift")
print("     -- developed by Joonsung Kim")
print("***************************************")
print("\n\n")

func sys(msg: String) {
    print("📘 SWIFT SYSTEM:: \(msg)")
}

func wsys(msg: String) {
    print("⚠️ SWIFT SYSTEM:: \(msg)")
}

func esys(msg: String) {
    print("🛑 SWIFT SYSTEM:: \(msg)")
}

func qsys(msg: String) {
    print("📙 SWIFT SYSTEM:: \(msg)")
}

func gsys(msg: String) {
    print("📗 GRAMMAR SYSTEM:: \(msg)")
}

func err(msg: String, app: String) {
    print("🛑 ERROR_\(app):: \(msg)")
}

func log(msg: String) {
    print("📖 LOG:: \(msg)")
}

func getUserPre(qst: String) -> String {
    print("\(qst):: ", terminator: "")
    return readLine()!
}

func getCmd() -> String {
    print("\(fullname):: ", terminator: "")
    return readLine()!
}

/*
sys(msg: "Debugging Mode?")
var debugging_pre:String = getUserPre(qst: "ADMINISTRATOR")
if debugging_pre == "0" {
    let dbg = "false"
}
else if debugging_pre == "1" {
    let dbg = "true"
}
else {
    let dbg = "error"
}
*/

func dbg(msg: String) {
    if msg == "false" {
        print("DEBUG:: \(msg)")
    }
}



func getYN() -> String {
    var yeslistlen = yes_list.count - 1
    var nolistlen = no_list.count - 1
    var tempAns:String
    let answer:String = readLine()!
    repeat {
        if answer == yes_list[yeslistlen] {
            tempAns = "yes"
            return "yes"
        }
        else {
            tempAns = "no"
            yeslistlen -= 1
        }
    } while yeslistlen > -1
    repeat {
        if answer == no_list[nolistlen] {
            tempAns = "no"
            return "no"
        }
        else {
            tempAns = "error"
            nolistlen -= 1
        }
    } while nolistlen > -1
    if tempAns == "no" {
        return "no"
    }
    else {
        return "error"
    }
}

func getName() -> String {
    qsys(msg: "Hey there, what's your name?")
    let name = getUserPre(qst: "NAME")
    let name_list = name.components(separatedBy: " ")
    var namevar1 = name_list.count - 1
    
    var belistlen = be_list.count - 1
    var tempName:String = "TesterName"
    repeat {
        var melistlen = me_list.count - 1
        repeat {
            if name_list[namevar1] == me_list[melistlen] {
                tempName = name_list[namevar1 + 2]
                break
            }
            else {
                repeat {
                    if name_list[namevar1] == be_list[belistlen] {
                        belistlen -= 1
                        tempName = "error0001_name"
                    }
                    else {
                        tempName = name_list[namevar1]
                        break
                    }
                } while belistlen > -1
                belistlen = be_list.count - 1
                melistlen -= 1
            }
        } while melistlen > -1
        melistlen = me_list.count
        namevar1 -= 1
    } while namevar1 > -1
    return tempName
}

var fullname:String = tempName
var getYNt:String
var tempName = getName()
if (tempName != "error0001_name") {
    print("\n")
    qsys(msg: "Okay, is your name \(tempName)?")
    print("RSPNS:: ", terminator: "")
    getYNt = getYN()
    if getYNt == "yes" {
        fullname = tempName
        sys(msg: "Good to know! I'll call you \(fullname) from now on.\n")
        qsys(msg: "Please confirm that this is your name with Yes/No")
        print("RSPNS:: ", terminator: "")
        getYNt = getYN()
        if getYNt == "yes" {
            print("\n")
            sys(msg: "Great!")
            sys(msg: "Please enjoy our services :-)")
            main_init()
        }
        else {
            fullname = getName()
        }
    }
    else {
        fullname = getName()
    }
}
else {
    esys(msg: "System code Error!!\nPlease contact system administrator.")
}

// let str = "gg"
// let arr = str.map { String($0) }
// print(arr)

func detGrammar(arr: Array<Any>) {
    var arrvar:Int = arr.count - 1
    var melistvar:Int = me_list.count - 1
    repeat {
        repeat {
            if arr[arrvar] as! String == me_list[melistvar] {
                let whodid:String = "you"
                var nextword:String = arr[arrvar+1] as! String
                var nexttwoword:String = arr[arrvar+2] as! String
                let nextword_arr:Array = nextword.map { String($0) }
                // let nwc = nextword_arr.count
                if nextword_arr[nextword_arr.count - 2] == "e" && nextword_arr[nextword_arr.count - 1] == "d" {
                    var _:String = "past"
                    let whatdid:String = nextword
                    gsys(msg: "It seems like this is a PAST TENSE.")
                    gsys(msg: "I understood that \(whodid) \(whatdid).")
                    let whatdid_pres:String = whatdid.replacingOccurrences(of: "ed", with: "")
                    gsys(msg: "You are probably done \(whatdid_pres)ing.")
                    
                    var articlelistvar = article_list.count - 1
                    repeat {
                        if nexttwoword == article_list[articlelistvar] {
                            var objective:String = arr[arrvar+3] as! String
                            log(msg: "New FUNCTION TESTING")
                            gsys(msg: "I understood(new) that \(article_list[articlelistvar]) \(objective) was \(whatdid) by \(whodid).")
                        }
                        articlelistvar -= 1
                    } while articlelistvar > -1
                    break
                }
                var havelistvar:Int = have_list.count - 1
                nextword = arr[arrvar+1] as! String
                print(nextword)
                repeat {
                    nexttwoword = arr[arrvar+2] as! String
                    var nexttwoword_arr:Array = nexttwoword.map { String($0) }
                    if nextword == have_list[havelistvar] {
                        if nexttwoword_arr[nexttwoword_arr.count - 2] == "e" && nexttwoword_arr[nexttwoword_arr.count - 1] == "d" {
                            var _:String = "past"
                            let whatdid:String = arr[arrvar+2] as! String
                            gsys(msg: "It seems like this is a PAST PRINCIPLE.")
                            gsys(msg: "I understood that \(whodid) \(have_list[havelistvar]) \(whatdid).")
                            let whatdid_pres:String = whatdid.replacingOccurrences(of: "ed", with: "")
                            gsys(msg: "You are probably done \(whatdid_pres)ing.")
                            
                            var nextthreeword:String = arr[arrvar+3] as! String
                            var articlelistvar = article_list.count - 1
                            repeat {
                                if nextthreeword == article_list[articlelistvar] && arrvar+4 < arr.count {
                                    var objective:String = arr[arrvar+4] as! String
                                    log(msg: "New FUNCTION TESTING")
                                    gsys(msg: "I understood(new) that \(article_list[articlelistvar]) \(objective) \(have_list[havelistvar]) been \(whatdid) by \(whodid).")
                                    break
                                }
                                articlelistvar -= 1
                            } while articlelistvar > -1
                            break
                        }
                    }
                    havelistvar -= 1
                } while havelistvar > -1
                var belistvar:Int = be_list.count - 1
                var didBV:Int = 0
                repeat {
                    if nextword == be_list[belistvar] {
                        gsys(msg: "This sentence has a BE VERB.")
                        let nkc_new:String = arr[arrvar+2] as! String
                        let nkcnew_arr:Array = nkc_new.map { String($0) }
                        let nkc = nkcnew_arr.count
                        if nkc - 3 > 0 {
                            if nkcnew_arr[nkc - 3] == "i" && nkcnew_arr[nkc - 2] == "n" && nkcnew_arr[nkc - 1] == "g" {
                                var _:String = "pp"
                                let newverb:String = nextword
                                let newnoun:String = nkc_new.replacingOccurrences(of: "ing", with: "")
                                gsys(msg: "It seems like this is a VERBAL NOUN.")
                                gsys(msg: "I understood that \(whodid) \(newverb) to \(newnoun).")
                                didBV = 1
                                break
                            }
                        break
                        }
                    }
                    belistvar -= 1
                } while belistvar > -1
                
                let nwc_new:String = arr[arrvar+2] as! String
                let nwcnew_arr:Array = nwc_new.map { String($0) }
                let ncc = nwcnew_arr.count
                if ncc - 3 > 0 && didBV != 1 {
                    if nwcnew_arr[ncc - 3] == "i" && nwcnew_arr[ncc - 2] == "n" && nwcnew_arr[ncc - 1] == "g" {
                        var _:String = "pp"
                        let newverb:String = nextword
                        let newnoun:String = nwc_new.replacingOccurrences(of: "ing", with: "")
                        gsys(msg: "It seems like this is a VERBAL NOUN.")
                        gsys(msg: "I understood that \(whodid) \(newverb) to \(newnoun).")
                        break
                    }
                }
            }
            melistvar -= 1
        } while melistvar > -1
        melistvar = me_list.count - 1
        arrvar -= 1
    } while arrvar > -1
    
    arrvar = arr.count - 1
    var youlistvar:Int = you_list.count - 1
    repeat {
        repeat {
            if arr[arrvar] as! String == you_list[youlistvar] {
                let whodid:String = "I"
                let nextword:String = arr[arrvar+1] as! String
                let nextword_arr:Array = nextword.map { String($0) }
                // let nwc = nextword_arr.count
                if nextword_arr[nextword_arr.count - 2] == "e" && nextword_arr[nextword_arr.count - 1] == "d" {
                    var _:String = "past"
                    let whatdid:String = nextword
                    gsys(msg: "It seems like this is a PAST TENSE.")
                    gsys(msg: "I understood that \(whodid) \(whatdid).")
                    let whatdid_pres:String = whatdid.replacingOccurrences(of: "ed", with: "")
                    gsys(msg: "I am probably done \(whatdid_pres)ing.")
                    break
                }
                var belistvar:Int = be_list.count - 1
                var didBV:Int = 0
                repeat {
                    if nextword == be_list[belistvar] {
                        gsys(msg: "This sentence has a BE VERB.")
                        let nkc_new:String = arr[arrvar+2] as! String
                        let nkcnew_arr:Array = nkc_new.map { String($0) }
                        let nkc = nkcnew_arr.count
                        if nkc - 3 > 0 {
                            if nkcnew_arr[nkc - 3] == "i" && nkcnew_arr[nkc - 2] == "n" && nkcnew_arr[nkc - 1] == "g" {
                                var _:String = "pp"
                                let newverb:String = nextword
                                let newnoun:String = nkc_new.replacingOccurrences(of: "ing", with: "")
                                gsys(msg: "It seems like this is a VERBAL NOUN.")
                                gsys(msg: "I understood that \(whodid) \(newverb) to \(newnoun).")
                                didBV = 1
                                break
                            }
                        break
                        }
                    }
                    belistvar -= 1
                } while belistvar > -1
                
                let nwc_new:String = arr[arrvar+2] as! String
                let nwcnew_arr:Array = nwc_new.map { String($0) }
                let ncc = nwcnew_arr.count
                if ncc - 3 > 0 && didBV != 1 {
                    if nwcnew_arr[ncc - 3] == "i" && nwcnew_arr[ncc - 2] == "n" && nwcnew_arr[ncc - 1] == "g" {
                        var _:String = "pp"
                        let newverb:String = nextword
                        let newnoun:String = nwc_new.replacingOccurrences(of: "ing", with: "")
                        gsys(msg: "It seems like this is a VERBAL NOUN.")
                        gsys(msg: "I understood that \(whodid) \(newverb) to \(newnoun).")
                        break
                    }
                }
            }
            youlistvar -= 1
        } while youlistvar > -1
        youlistvar = me_list.count - 1
        arrvar -= 1
    } while arrvar > -1
}

func main() {
    var doGram = 1
    let greetings_list = ["Welcome, \(fullname)!", "Hi there, \(fullname)!", "Hiya!", "Type in a command below. :)"]
    print("\n\n")
    let number_rand = Int.random(in: 0...3)
    sys(msg: "\(greetings_list[number_rand])")
    let command:String = getCmd()
    let command_list = command.components(separatedBy: " ")
    print(command_list)
    
    var isCommand = 0
    var commandinputlistvar = command_input_list.count - 1
    
    repeat {
        var commandlistvar = command_list.count - 1
        repeat {
            if command_list[commandlistvar] == command_input_list[commandinputlistvar] {
                sys(msg: "I believe that this is a COMMAND.")
                isCommand = 1
                runCommand(cmd: command_input_list[commandinputlistvar])
                doGram = 0
                break
            }
            else {
                commandlistvar -= 1
            }
        } while commandlistvar > -1
        commandinputlistvar -= 1
    } while commandinputlistvar > -1

    if isCommand == 0 {
        print("\n")
        err(msg: "Warning (No such COMMAND)", app: "detCMD")
    }
    
    if doGram != 0 {
        detType(cmd: command)
        detGrammar(arr: command_list)
    }
}

func main_init() {
    repeat {
        main()
    } while 0 == 0
}

func detQuit(msg: String) {
    if msg == "quit" {
        main_init()
    }
}
    
func detType(cmd: String) {
    // var type:String
    if cmd.hasSuffix(".") {
        // type = "n"
        gsys(msg: "Recieved NORMAL SENTENCE")
    }
    else if cmd.hasSuffix("?") {
        // type = "q"
        gsys(msg: "Recieved QUESTION")
    }
    else if cmd.hasSuffix("!") {
        // type = "e"
        gsys(msg: "Recieved EXCLAMATION")
    }
    else {
        // type = "n"
        gsys(msg: "Recieved NORMAL SENTENCE")
        wsys(msg: "This may not be accurate!")
    }
}


func detCmd(command_list: Array<Any>) {
    var isCommand = 0
    var commandinputlistvar = command_input_list.count - 1
    
    var commandlistvar = command_list.count - 1
    repeat {
        repeat {
            if command_list[commandlistvar] as! String == command_input_list[commandinputlistvar] {
                sys(msg: "I believe that this is a COMMAND.")
                isCommand = 1
                runCommand(cmd: command_input_list[commandinputlistvar])
            }
            else {
                commandlistvar -= 1
            }
        } while commandlistvar > -1
        commandinputlistvar -= 1
    } while commandinputlistvar > -1

    if isCommand == 0 {
        err(msg: "Warning (No such COMMAND)", app: "detCMD")
    }
}


// Calculator APP
// function inside chatbot

func clc(msg: String) {
    print("📱 CALC:: \(msg)")
}

func cmd_calc() {
    print("\n\n")
    print("***************************************")
    print("     Swift Calculator")
    print("     -- version 0.0.1")
    print("     -- developed by Joonsung Kim")
    print("***************************************")
    print("\n")
    clc(msg: "What kind of calculation would you like to do?")
    print("\n  📲 1. Addition (+)")
    print("  📲 2. Subtraction (-)")
    print("  📲 3. Multiplication (*)")
    print("  📲 4. Division (/)")
    print("  📲 99. Go back to main chatbot")
    print("\n")
    let typeCalc:String = getCmd()
    if typeCalc == "1" {
        print(calc_addition())
    }
    else if typeCalc == "2" {
        print(calc_subtraction())
    }
    else if typeCalc == "3" {
        print(calc_multiplication())
    }
    else if typeCalc == "4" {
        print(calc_division())
    }
    else if typeCalc == "99" {
        main_init()
    }
    else {
        err(msg: "TypeErr (No such option)", app: "CALC")
        cmd_calc()
    }
}

func calc_addition() -> String {
    clc(msg: "Enter addition expression below.")
    clc(msg: "Please do not contain spaces,")
    clc(msg: "and use the + sign in expressions.")
    clc(msg: "You can enter as many numbers as you'd like to.")
    clc(msg: "Example> 34+35, 19.314+308.3+119")
    clc(msg: "Type 'quit' to exit to main menu.")
    print("\n")
    let a_eq:String = getCmd()
    let a_eq_list = a_eq.components(separatedBy: "+")
    var aeqlistvar:Int = a_eq_list.count - 1
    var resulta: Float = 0
    detQuit(msg: a_eq)
    repeat {
        if let floatValue = Float(a_eq_list[aeqlistvar]) {
            resulta += floatValue
        }
        else {
            err(msg: "TypeErr (Number Type is not valid)", app: "CALC")
            break
        }
        aeqlistvar -= 1
    } while aeqlistvar > -1
    print("\n")
    return "📲 ADD_ANSWER:: \(resulta)"
}

func calc_subtraction() -> String {
    clc(msg: "Enter subtraction expression below.")
    clc(msg: "Please do not contain spaces,")
    clc(msg: "and use the - sign in expressions.")
    clc(msg: "Please only enter two numbers.")
    clc(msg: "Example> 78-9, 95.12-38.3")
    clc(msg: "Type 'quit' to exit to main menu.")
    print("\n")
    let s_eq:String = getCmd()
    _ = s_eq.components(separatedBy: "-")
    var results:Float = 0
    detQuit(msg: s_eq)
    // result = Float(a_eq_list[0]) - Float(a_eq_list[1])
    results = 0
    print("\n")
    return "📲 SUB_ANSWER:: \(results)"
}

func calc_multiplication() -> String {

    return "⚠️ WARNING:: Sorry, but I'm still developing this feature!"
}

func calc_division() -> String {

    return "⚠️ WARNING:: Sorry, but I'm still developing this feature!"
}

func runCommand(cmd: String) {
    if cmd == "weather" {
        // cmd_weather()
        wsys(msg: "Weather function is not yet ready.")
    }
    else if cmd == "time" {
        // cmd_time()
        wsys(msg: "Time function is not yet ready.")
    }
    else if cmd == "calc" || cmd == "calculator" {
        cmd_calc()
    }
    else if cmd == "help" {
        // cmd_help()
        wsys(msg: "Help function is not yet ready.")
    }
    else if cmd == "quit" || cmd == "exit" {
        esys(msg: "QUITTING APPLICATION!!!")
        exit(0)
    }
    else {
        err(msg: "InputErr (No such COMMAND)", app: "CMD")
    }
}

main_init()

