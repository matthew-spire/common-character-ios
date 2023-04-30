//
//  CharacterAPIImplementation.swift
//  CharacterViewer
//
//  Created by Matthew Spire on 4/29/23.
//

import Foundation
import Combine

// Class that implements the CharacterAPI protocol and fetches character data from the API.
class CharacterAPIImplementation: CharacterAPI {
    // The base URL for fetching character data from the DuckDuckGo API.
    private let baseURL = "https://api.duckduckgo.com/?format=json"

    // Function that fetches characters from the DuckDuckGo API based on the query parameter.
    func fetchCharacters(query: String) -> AnyPublisher<[Character], Error> {
        // Create a URL by appending the query parameter to the base URL.
        // Use a guard let statement to safely unwrap the optional URL. If the URL is nil, return a publisher that immediately fails with a URLError.
        guard let url = URL(string: baseURL + "&q=" + query) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        // Use URLSession's dataTaskPublisher to fetch data from the URL.
        return URLSession.shared.dataTaskPublisher(for: url)
            // Extract the data from the received response.
            .map(\.data)
            // Decode the data into a RelatedTopicsResponse object using a JSONDecoder.
            .decode(type: RelatedTopicsResponse.self, decoder: JSONDecoder())
            // Extract the relatedTopics array from the decoded RelatedTopicsResponse object.
            .map { $0.relatedTopics }
            // Convert the publisher to an AnyPublisher.
            .eraseToAnyPublisher()
    }
}
