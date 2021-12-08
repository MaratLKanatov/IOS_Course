var dates = [String]() // All dates
var age18_25 = [String]()
var age26_35 = [String]()
var age36_50 = [String]()

func menu() -> Int?{
    print("\n\n 0 - Exit")
    print(" 1 - Enter birth dates")
    print(" 2 - List 18-25 years")
    print(" 3 - List 26-35 years")
    print(" 4 - List 36-50 years")
    print(" 5 - Locate dates in needed diapazon")
    print(" >>> ", terminator: "")
    
    let choose = Int((readLine())!)
    return choose
}

func getBirthDates() -> [String] {
    print("\n How many birth dates: ", terminator: "")
    let count = Int((readLine())!)
    var datesArr = [String]()
    for _ in 1...(count!) {
        print(" Birth date: ", terminator: "")
        let birthDate:String = (readLine())!
        datesArr.append(birthDate)
    }
    return datesArr
}

func printList(_ list:[String], title: String){
    print("\(title)\n-----------------")
    for line in list {
        print(line)
    }
}

func re_locate(){
    func countAge(_ date:String, _ curDate:String) -> Int {
        // сначала годы минусуй: текущий-год рождения. добавь это значения к результату 
        // если текущий месяц больше чем месяц рождения - ничего 
        // но если месяц меньше - минусуй результат на единичку
        // но если месяц равен идем дальше
        // если текущий день больше чем день рождения - ничего
        // а если не так то - минусуй на единичку
        // 13.06.2002 - day month year ~ 2 2 4
      
        let birthDayS = date[...(date.index(date.startIndex, offsetBy: 1))] // 0..1
        let birthMonthS = date[date.index(date.startIndex, offsetBy: 3)...(date.index(date.startIndex, offsetBy: 4))] // 3..4
        let birthYearS = date[date.index(date.startIndex, offsetBy: 6)...(date.index(date.startIndex, offsetBy: 9))] // 6..9
      
        let birthDay:Int = ((Int)(birthDayS))!
        let birthMonth:Int = ((Int)(birthMonthS))!
        let birthYear:Int = ((Int)(birthYearS))!
        
        let curDayS = curDate[...(curDate.index(curDate.startIndex, offsetBy: 1))] // 0..1
        let curMonthS = curDate[curDate.index(curDate.startIndex, offsetBy: 3)...(curDate.index(curDate.startIndex, offsetBy: 4))] // 3..4
        let curYearS = curDate[curDate.index(curDate.startIndex, offsetBy: 6)...(curDate.index(curDate.startIndex, offsetBy: 9))] // 6..9
      
        let curDay:Int = ((Int)(curDayS))!
        let curMonth:Int = ((Int)(curMonthS))!
        let curYear:Int = ((Int)(curYearS))!
        
        var result:Int = 0
        if (curYear >= birthYear) {
            result = curYear - birthYear
            if (curMonth < birthMonth) {
                result -= 1
            } else if (curMonth == birthMonth) {
                if (curDay < birthDay) {
                    result -= 1
                }
            }
        }
        
        return result
    }

    print("\n Current date: ", terminator: "")
    let curDate = readLine()
    
}

func run(){
    var status = true
    while (status) {
        switch menu() {
            case 0: // Exit
                status = false
                print("LOG: exited")
            case 1: // Enter birth dates
                dates = getBirthDates()
                print("LOG: Entered birth dates")
            case 2: // List 18-25 years
                printList(age18_25, title: "18-25 years")
                print("LOG: List 18-25 years")
            case 3: // List 26-35 years
                printList(age26_35, title: "26-35 years")
                print("LOG: List 26-35 years")
            case 4: // List 36-50 years
                printList(age36_50, title: "36-50 years")
                print("LOG: List 36-50 years")
            case 5: // re-locate dates to diapazon
                re_locate()
                print("LOG: re-locate dates to diapazon")
            case _: // wrong choose, try again
                print("LOG: Wrong choose, try again!!!")
        }
    }    
}

func main(){
    run()
}

main()