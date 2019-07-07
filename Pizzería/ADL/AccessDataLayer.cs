using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Entity.Core.Objects;
using ADL;
using Entities;



namespace ADL
{
    public class AccessDataLayer
    {

        BDRestauranteProyectoLenguajesEntities database = new BDRestauranteProyectoLenguajesEntities();

        /*CRUD PLates Start*/
        Plato plato;
        public Boolean InsertPlate(Plato plate)
        {
            database.Plato.Add(plate);
            database.SaveChanges();
            return true;
        }

        public Boolean ModifyPlate(Plato plateModify)
        {
            database.PROC_MODIFICAR_PLATO(plateModify.PlatoID, plateModify.Nombre, plateModify.Descripcion, plateModify.Precio, plateModify.Fotografia, plateModify.HabilitadoSN, plateModify.TiempoPreparacionMinutos);
            return true;
        }

        public Plato Get_Plate_Client(string name, int price ) {
            var query = from party in database.Plato
                        where party.Nombre == name && party.Precio == price
                        select party;

            foreach (Plato item in query.ToList())
            {
                return item;
            }
            return null;

        }


        public Plato SearchPlateID(int plateID)
        {
            return database.Plato.Find(plateID);
        }

        public List<Plato> ShowPlates()
        {
           return database.Plato.ToList(); 
        }

        public Boolean DeletePlate(Plato plate)
        {
            database.Plato.Remove(plate);
            database.SaveChanges();
            return true;
        }

        public Boolean SearchRelationOfPlate(int id)
        {
            ObjectParameter Output = new ObjectParameter("Contador", typeof(Int32));
            database.PROC_RELACION_PLATO_ORDEN(id, Output);
            int relation = (int)Output.Value;

            


            if (relation == 0)
            {
                return DeletePlate(SearchPlateID(id));
            }
            return false;
        }

        public List<PROC_BUSCAR_NOMBRE_PLATO_Result> SearchByName(String name)
        {
            var list = database.PROC_BUSCAR_NOMBRE_PLATO(name);
            return list.ToList();
        }

        /*Nuevo */ /*
        public List<proc_Buscar_Nombre_Plato_Filter_Result> SearchByNameFilter(string name)
        {
            var list = database.proc_Buscar_Nombre_Plato_Filter(name);
            return list.ToList();
        } */

        /*CRUD Plates Finish*/


        /*CRUD Order Start*/

        Orden order = new Orden();

        public void addOrder(Orden newOrder, List<LineaOrden> orderLines)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                db.Orden.Add(newOrder);
                db.SaveChanges();
                foreach (LineaOrden line in orderLines)
                {
                    db.LineaOrden.Add(line);
                }
                db.SaveChanges();
            }
        }

        public List<Orden> ordersTable()
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.Orden.ToList();
                //return ToDataTable(db.Orden.ToList());
            }
        }

        public void deleteOrderLine() {

        }


        /*CRUD Order Finish*/


        /*CRUD Users Start*/
        public void addUser(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password, int typeOfUser, String enabled)
        {
            Party party = new Party();
            party.CorreoElectronico = email;
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = firstLastName;
            party.SegundoApellido = secondLastName;
            party.Direccion = address;
            party.Contraseña = password;
            party.Habilitado_S_N_ = enabled;
            party.TipoParty = typeOfUser;
            database.Party.Add(party);
            database.SaveChanges();
        }

        public void addCustumer(String email, String firstName, String secondName, String lastName1, String lastName2, String address, String password)
        {
            Party party = new Party();
            party.CorreoElectronico = email;
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = lastName1;
            party.SegundoApellido = lastName2;
            party.Direccion = address;
            party.Contraseña = password;
            party.Habilitado_S_N_ = "s";
            party.TipoParty = 2;
            database.Party.Add(party);
            database.SaveChanges();


        }

        public void addAdmin(String email, String firstName, String secondName, String lastName1, String lastName2, String address, String password)
        {
            Party party = new Party();
            party.CorreoElectronico = email;
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = lastName1;
            party.SegundoApellido = lastName2;
            party.Direccion = address;
            party.Contraseña = password;
            party.TipoParty = 1;
            database.Party.Add(party);
            database.SaveChanges();


        }

        public void addChef(String email, String firstName, String secondName, String lastName1, String lastName2, String address, String password)
        {
            Party party = new Party();
            party.CorreoElectronico = email;
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = lastName1;
            party.SegundoApellido = lastName2;
            party.Direccion = address;
            party.Contraseña = password;
            party.TipoParty = 3;
            database.Party.Add(party);
            database.SaveChanges();
        }

        /****************Delete*******************/
        public void deleteParty(String address)
        {
            Party party = database.Party.Single(u => u.CorreoElectronico == address);
            database.Party.Remove(party);
            database.SaveChanges();
        }




        /*************BLOCK BY EMAIL****************/
        public void blockCustumer(String email)
        {
            Party party = database.Party.Single(u => u.CorreoElectronico == email);
            party.Habilitado_S_N_ = "N";
            database.SaveChanges();
        }

        public void unblockCustumer(String email)
        {
            Party party = database.Party.Single(u => u.CorreoElectronico == email);
            party.Habilitado_S_N_ = "S";
            database.SaveChanges();
        }


        /********************UPDATE*********************/
        public void updateParty(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password, int typeOfUser, String enabled)
        {
            Party party = database.Party.Single(u => u.CorreoElectronico == email);
            party.CorreoElectronico = email;
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = firstLastName;
            party.SegundoApellido = secondLastName;
            party.Direccion = address;
            party.Contraseña = password;
            party.Habilitado_S_N_ = enabled;
            party.TipoParty = typeOfUser;
            //database.Party.Add(party);
            database.SaveChanges();
        }

        public void updateParty2(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password, String enabled)
        {
            Party party = database.Party.Single(u => u.CorreoElectronico == email);
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = firstLastName;
            party.SegundoApellido = secondLastName;
            party.Direccion = address;
            party.Contraseña = password;
            party.Habilitado_S_N_ = enabled;
            database.SaveChanges();
        }
        public void updateClientInformation(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password)
        {
            Party party = database.Party.Single(u => u.CorreoElectronico == email);
            party.CorreoElectronico = email;
            party.PrimerNombre = firstName;
            party.SegundoNombre = secondName;
            party.PrimerApellido = firstLastName;
            party.SegundoApellido = secondLastName;
            party.Direccion = address;
            party.Contraseña = password;

            database.SaveChanges();
        }

        /*********************GET USERS***************************/
        public DataTable getUsers()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Tipo Usuario");
            dt.Columns.Add("CorreoElectronico");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Apellido 1");
            dt.Columns.Add("Apellido 2");
            dt.Columns.Add("Direccion");


            foreach (View_users item in database.View_users.ToList())
            {
                dt.Rows.Add(item.Descripcion, item.CorreoElectronico, item.PrimerNombre, item.PrimerApellido, item.SegundoApellido, item.Direccion);
            }
            return dt;
        }

        public void addOrder(String email, Decimal total, List<LineaOrden> orderLines)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                ObjectParameter ob = new ObjectParameter("ordenID", typeof(int));
                db.PROC_AGREGAR_ORDEN(email, System.DateTime.Now, total, ob);
                int orderID = (int)ob.Value;
                foreach (LineaOrden line in orderLines)
                {
                    line.OrdenID = orderID;
                    db.LineaOrden.Add(line);
                }
                db.SaveChanges();
            }
        }


        public List<Party> getParty()
        {
            var query = from party in database.Party
                        select party;
            return query.ToList();

        }


        /*****************SEARCH*********************/

        public DataTable SearchUsers(String name)
        {
            var users = database.proc_search_user(name);

            DataTable dt = new DataTable();
            dt.Columns.Add("Tipo Usuario");
            dt.Columns.Add("CorreoElectronico");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Apellido 1");
            dt.Columns.Add("Apellido 2");
            dt.Columns.Add("Direccion");


            foreach (proc_search_user_Result item in users.ToList())
            {
                dt.Rows.Add(item.Descripcion, item.CorreoElectronico, item.PrimerNombre, item.PrimerApellido, item.SegundoApellido, item.Direccion);
            }
            return dt;

        }

        public DataTable searchParty(String email)
        {
            var query = from party in database.Party
                        where party.CorreoElectronico == email
                        select party;
            List<Party> list = query.ToList();
            DataTable dt = new DataTable();
            dt.Columns.Add("CorreoElectronico");
            dt.Columns.Add("Contraseña");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Apellido 1");
            dt.Columns.Add("Apellido 2");
            dt.Columns.Add("Direccion");

            foreach (Party item in list)
            {
                dt.Rows.Add(item.CorreoElectronico, item.Contraseña, item.PrimerNombre, item.PrimerApellido, item.SegundoApellido, item.Direccion);
            }
            return dt;
        }

        public Party searchPartyClient(String email)
        {
            var query = from party in database.Party
                        where party.CorreoElectronico == email
                        select party;
            List<Party> list = query.ToList();

            foreach (Party item in list)
            {
                return item;
            }
            return null;
        }
        /*CRUD Users Finish*/



        public void changeStateOrder(int ordenID, int stateID)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                db.PROC_CHANGE_STATE(ordenID, stateID);
            }
        }

        public Orden findOrder(int orderID)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.Orden.Find(orderID);
            }
        }

        // load orders
        public List<PROC_ALL_ORDERS_Result> LoadAllOrders()
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_ALL_ORDERS(1).ToList();
            }
        }
        // only email
        public List<PROC_FILTER_ORDERS_BY_EMAIL_Result> FilterByEmail(String email)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_EMAIL(email).ToList();
            }
        }
        // only date
        public List<PROC_FILTER_ORDERS_BY_DATE_Result> FilterByDate(DateTime firstDate, DateTime secondDate)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_DATE(firstDate, secondDate).ToList();
            }
        }
        // only state
        public List<PROC_FILTER_ORDERS_BY_STATE_Result> FilterByState(int state)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_STATE(state).ToList();
            }
        }
        // email - date
        public List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_Result> FilterByEmail_Date(String email, DateTime firstDate, DateTime secondDate)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_EMAIL_DATE(email, firstDate, secondDate).ToList();
            }
        }
        // email - state
        public List<PROC_FILTER_ORDERS_BY_EMAIL_STATE_Result> FilterByEmail_State(String email, int state)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_EMAIL_STATE(email, state).ToList();
            }
        }
        // date - state
        public List<PROC_FILTER_ORDERS_BY_DATE_STATE_Result> FilterByDate_State(DateTime firstDate, DateTime secondDate, int state)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_DATE_STATE(firstDate, secondDate, state).ToList();
            }
        }
        // email - date - state
        public List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_STATE_Result> FilterByEmail_Date_State(String email, DateTime firstDate, DateTime secondDate, int state)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_FILTER_ORDERS_BY_EMAIL_DATE_STATE(email, firstDate, secondDate, state).ToList();
            }
        }

        // kitchen orders
        public List<PROC_KITCHEN_ORDERS_Result> LoadKitchenOrders()
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                return db.PROC_KITCHEN_ORDERS(1).ToList();
            }
        }

        public void setTimesToOrders(List<int> numOrders)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                foreach (int orderID in numOrders)
                {
                    db.PROC_SET_TIMES_TO_ORDERS(orderID, System.DateTime.Now);
                }
            }

        }

        public void deliverOrder(int orderID)
        {
            using (BDRestauranteProyectoLenguajesEntities db = new BDRestauranteProyectoLenguajesEntities())
            {
                db.PROC_CHANGE_STATE(orderID, 4);
            }
        }



    }
}
