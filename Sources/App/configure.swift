import FluentPostgreSQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config,
                      _ env: inout Environment,
                      _ services: inout Services) throws {
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    // -- SQL --
    // 注册 PostgreSQL
    try services.register(FluentPostgreSQLProvider())
    let postgreSQLDatabase = PostgreSQLDatabase(config: .PerspectiveConfig)
    
    // 将 PostgreSQL 注册到数据库配置中
    var databases = DatabasesConfig()
    databases.add(database: postgreSQLDatabase, as: .psql)
    services.register(databases)

    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Todo.self, database: .sqlite)
    services.register(migrations)
}

// MARK: SQL Config
extension PostgreSQLDatabaseConfig {
    static let PerspectiveConfig: PostgreSQLDatabaseConfig = {
        let hostname = "http://localhost"
        let port = 5432
        let username = "kingcos"
        let database = "Perspective"
        let password = ""
        
        return PostgreSQLDatabaseConfig(hostname: hostname,
                                        port: port,
                                        username: username,
                                        database: database,
                                        password: password)
    }()
}
