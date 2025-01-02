//
//  FunctionTools.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 26/12/24.
//

import ChatGPTSwift
import Foundation

let tools: [Components.Schemas.ChatCompletionTool] = [
    .init(_type: .function, function:
            .init(
                description: "Add expense log",
                name: "addExpenseLog",
                parameters: try! .init(additionalProperties: .init(unvalidatedValue: [
                    "type": "object",
                    "properties": [
                        "title": [
                            "type": "string",
                            "description": "Title or description of the expense"
                        ],
                        "amount": [
                            "type": "number",
                            "description": "Cost or amount of the expense"
                        ],
                        "currency": [
                            "type": "string",
                            "description": "Currency of the amount or cost. If you're not sure, use USD by default"
                        ],
                        "category": [
                            "type": "string",
                            "enum": Category.allCases.map { $0.rawValue },
                            "description": "Category of the expense. Infer if not provided"
                        ],
                        "date": [
                            "type": "string",
                            "description": "Date of the expense (yyyy-MM-dd). Use the current date if not specified"
                        ]
                    ],
                    // ✅ Place "required" inside the same object as "properties"
                    // Does not work in gpt 3.5
                    "required": ["amount", "category", "date"]
                ])))
        )
]

