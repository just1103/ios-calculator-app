import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        
        componentsByOperators(from: input).compactMap { Double($0) }
            .forEach { formula.operands.enqueue(value: $0) }
        
        input.compactMap { Operator(rawValue: $0) }
            .forEach { formula.operators.enqueue(value: $0) }
        
        return formula
    }
  
    static func componentsByOperators(from input: String) -> [String] {
        var components: [String] = [input]

        components = Operator.allCases.reduce(components) { result, element in
            result.flatMap { $0.split(with: element.rawValue) }
        }

        return components
    }
}
