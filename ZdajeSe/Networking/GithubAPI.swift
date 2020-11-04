//
//  GithubAPI.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation
import Combine

enum GithubAPI {
    static let agent = Agent()
    static let base = URL(string: "https://api.github.com")!
}

extension Agent {
    
    func runFromFile<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, ZSError> {
        return urlSession
            .dataTaskPublisher(for: request)
            .print()
            .tryMap { result -> Response<GithubFile> in
                let value = try decoder.decode(GithubFile.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .tryMap {
                guard let data = Data(base64Encoded: $0.value.content, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters) else {
                    throw ZSError.networkError(message: "Base64 wrongly parsed")
                }
                let value = try decoder.decode(T.self, from: data)
                
                return Response(value: value, response: $0.response)
            }
            .mapError { error -> ZSError in
                guard error is ZSError else {
                    return ZSError.networkError(message: "Couldn't fetch file")
                }
                return error as! ZSError
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    struct GithubFile: Decodable {
        let content: String
        let encoding: String
        let url: String
    }
    
}

struct GithubStore: ExamsProvidable {
    
    private let repoDataOwner = "bibixx"
    private let repoName = "zdaj-se-pjatk-data"
    private let examsOverviewsFileName = "index.json"
    
    func getExams() -> AnyPublisher<[ExamOverview], ZSError> {
        return getExamsOverviewsList()
            .map(\.pages)
            .eraseToAnyPublisher()
    }
    
    //TODO: - Convert to single reuqest whole repo, then fetch single file from local cache
    private func getExamsOverviewsList() -> AnyPublisher<ExamOverview.ExamResponseWrapper, ZSError> {
        return GithubAPI.agent.runFromFile(URLRequest(url: GithubAPI.base.appendingPathComponent("/repos/\(repoDataOwner)/\(repoName)/contents/\(examsOverviewsFileName)")))
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func getExamDetails(forExamId exam: String) -> AnyPublisher<Exam, ZSError> {
        return GithubAPI.agent.runFromFile(URLRequest(url: GithubAPI.base.appendingPathComponent("/repos/\(repoDataOwner)/\(repoName)/contents/\(exam)")))
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
