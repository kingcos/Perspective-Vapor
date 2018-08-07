//  This file was automatically generated and should not be edited.

import Apollo

public final class IssueQuery: GraphQLQuery {
  public let operationDefinition =
    "query Issue($repo_owner: String!, $repo_name: String!, $issue_num: Int!) {\n  repository(owner: $repo_owner, name: $repo_name) {\n    __typename\n    issue(number: $issue_num) {\n      __typename\n      title\n      createdAt\n      labels(first: 1) {\n        __typename\n        nodes {\n          __typename\n          name\n        }\n      }\n      body\n      comments(first: 10) {\n        __typename\n        nodes {\n          __typename\n          author {\n            __typename\n            login\n            avatarUrl\n          }\n          body\n        }\n      }\n    }\n  }\n}"

  public var repo_owner: String
  public var repo_name: String
  public var issue_num: Int

  public init(repo_owner: String, repo_name: String, issue_num: Int) {
    self.repo_owner = repo_owner
    self.repo_name = repo_name
    self.issue_num = issue_num
  }

  public var variables: GraphQLMap? {
    return ["repo_owner": repo_owner, "repo_name": repo_name, "issue_num": issue_num]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": GraphQLVariable("repo_owner"), "name": GraphQLVariable("repo_name")], type: .object(Repository.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("issue", arguments: ["number": GraphQLVariable("issue_num")], type: .object(Issue.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(issue: Issue? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "issue": issue.flatMap { (value: Issue) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Returns a single issue from the current repository by number.
      public var issue: Issue? {
        get {
          return (resultMap["issue"] as? ResultMap).flatMap { Issue(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "issue")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("labels", arguments: ["first": 1], type: .object(Label.selections)),
          GraphQLField("body", type: .nonNull(.scalar(String.self))),
          GraphQLField("comments", arguments: ["first": 10], type: .nonNull(.object(Comment.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, createdAt: String, labels: Label? = nil, body: String, comments: Comment) {
          self.init(unsafeResultMap: ["__typename": "Issue", "title": title, "createdAt": createdAt, "labels": labels.flatMap { (value: Label) -> ResultMap in value.resultMap }, "body": body, "comments": comments.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the issue title.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// Identifies the date and time when the object was created.
        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// A list of labels associated with the object.
        public var labels: Label? {
          get {
            return (resultMap["labels"] as? ResultMap).flatMap { Label(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "labels")
          }
        }

        /// Identifies the body of the issue.
        public var body: String {
          get {
            return resultMap["body"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        /// A list of comments associated with the Issue.
        public var comments: Comment {
          get {
            return Comment(unsafeResultMap: resultMap["comments"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "comments")
          }
        }

        public struct Label: GraphQLSelectionSet {
          public static let possibleTypes = ["LabelConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LabelConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of nodes.
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["Label"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Label", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the label name.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes = ["IssueCommentConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "IssueCommentConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of nodes.
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["IssueComment"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("author", type: .object(Author.selections)),
              GraphQLField("body", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(author: Author? = nil, body: String) {
              self.init(unsafeResultMap: ["__typename": "IssueComment", "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "body": body])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The actor who authored the comment.
            public var author: Author? {
              get {
                return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "author")
              }
            }

            /// The body as Markdown.
            public var body: String {
              get {
                return resultMap["body"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "body")
              }
            }

            public struct Author: GraphQLSelectionSet {
              public static let possibleTypes = ["Organization", "User", "Bot"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeOrganization(login: String, avatarUrl: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
              }

              public static func makeUser(login: String, avatarUrl: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
              }

              public static func makeBot(login: String, avatarUrl: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The username of the actor.
              public var login: String {
                get {
                  return resultMap["login"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "login")
                }
              }

              /// A URL pointing to the actor's public avatar.
              public var avatarUrl: String {
                get {
                  return resultMap["avatarUrl"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "avatarUrl")
                }
              }
            }
          }
        }
      }
    }
  }
}