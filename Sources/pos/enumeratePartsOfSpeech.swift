import Foundation
#if canImport(NaturalLanguage)
import NaturalLanguage
#endif

@available(OSX 10.14, *)
extension NLTag {
    var uppercaseStringRepresentation: String? {
        switch self {
        case .adjective:
            return "ADJECTIVE"
        case .adverb:
            return "ADVERB"
        case .classifier:
            return "CLASSIFIER"
        case .conjunction:
            return "CONJUNCTION"
        case .determiner:
            return "DETERMINER"
        case .idiom:
            return "IDIOM"
        case .interjection:
            return "INTERJECTION"
        case .noun:
            return "NOUN"
        case .number:
            return "NUMBER"
        case .particle:
            return "PARTICLE"
        case .preposition:
            return "PREPOSITION"
        case .pronoun:
            return "PRONOUN"
        case .verb:
            return "VERB"
        default:
            return nil
        }
    }
}

extension NSLinguisticTag {
    var uppercaseStringRepresentation: String? {
        switch self {
        case .adjective:
            return "ADJECTIVE"
        case .adverb:
            return "ADVERB"
        case .classifier:
            return "CLASSIFIER"
        case .conjunction:
            return "CONJUNCTION"
        case .determiner:
            return "DETERMINER"
        case .idiom:
            return "IDIOM"
        case .interjection:
            return "INTERJECTION"
        case .noun:
            return "NOUN"
        case .number:
            return "NUMBER"
        case .particle:
            return "PARTICLE"
        case .preposition:
            return "PREPOSITION"
        case .pronoun:
            return "PRONOUN"
        case .verb:
            return "VERB"
        default:
            return nil
        }
    }
}

func enumeratePartsOfSpeech(in string: String, using block: (String, String) -> Void) {
    if #available(OSX 10.14, *) {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = string
        tagger.enumerateTags(in: string.startIndex ..< string.endIndex, unit: .word, scheme: .lexicalClass, options: []) { (tag, range) -> Bool in
            if let uppercaseStringRepresentation = tag?.uppercaseStringRepresentation {
                block(uppercaseStringRepresentation, String(string[range]))
            }

            return true
        }
    } else {
        let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
        tagger.string = string
        tagger.enumerateTags(in: NSRange(string.startIndex ..< string.endIndex, in: string), scheme: .lexicalClass, options: []) { tag, tokenRange, _, _ in
            if let uppercaseStringRepresentation = tag?.uppercaseStringRepresentation {
                block(uppercaseStringRepresentation, (string as NSString).substring(with: tokenRange))
            }
        }
    }
}
