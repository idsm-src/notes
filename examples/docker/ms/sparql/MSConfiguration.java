package cz.iocb.chemweb.server.sparql.config;

import static java.util.Arrays.asList;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import cz.iocb.chemweb.server.sparql.config.SparqlDatabaseConfiguration;
import cz.iocb.chemweb.server.sparql.config.isdb.IsdbConfiguration;
import cz.iocb.chemweb.server.sparql.config.mona.MonaConfiguration;
import cz.iocb.chemweb.server.sparql.config.sachem.Sachem;
import cz.iocb.chemweb.server.sparql.database.Column;
import cz.iocb.chemweb.server.sparql.database.DatabaseSchema;
import cz.iocb.chemweb.server.sparql.database.TableColumn;
import cz.iocb.chemweb.server.sparql.mapping.classes.ResourceClass;



public class MSConfiguration extends SparqlDatabaseConfiguration
{
    public MSConfiguration(String service, DataSource connectionPool, DatabaseSchema schema) throws SQLException
    {
        super("http:://localhost", connectionPool, schema);

        addService(new MonaConfiguration(null, connectionPool, getDatabaseSchema()), true);
        addService(new IsdbConfiguration(null, connectionPool, getDatabaseSchema()), true);

        Map<ResourceClass, List<Column>> mapping = new HashMap<ResourceClass, List<Column>>();
        mapping.put(this.getIriClass("isdb:compound"), asList(new TableColumn("isdb")));
        mapping.put(this.getIriClass("mona:compound"), asList(new TableColumn("mona")));

        Sachem.addResourceClasses(this);
        Sachem.addProcedures(this, "sachem", mapping);
        Sachem.addFunctions(this);

        addServiceDescription();
    }
}
