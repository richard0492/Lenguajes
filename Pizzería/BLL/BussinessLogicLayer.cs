using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ADL;
using Entities;

namespace BLL
{
    public class BussinessLogicLayer
    {
        AccessDataLayer accessData = new AccessDataLayer();
        DataTable dt = new DataTable();

        Validation validation = new Validation();
        Plato plate = new Plato();


        /*Plates Start*/
        /*Client Plate Data*/
        public List<String>  Get_Plate_ToClient(string name, int price) {

            Plato plate = accessData.Get_Plate_Client(name, price);
            List<string> list = new List<string>();
            list.Add(plate.Nombre);
            list.Add(plate.Precio + "");
            list.Add(plate.Descripcion);
            list.Add(plate.PlatoID + "");
            
            if (plate.Fotografia != null) {
                byte[] image = plate.Fotografia;
                string realImage = Convert.ToBase64String(image, 0, image.Length);
                list.Add(realImage);
            }
            
            


            return list;
        }


        public void CreateOrder(List<LineaOrden> orderLines, String email)
        {
            decimal total = 0;
            foreach (LineaOrden line in orderLines)
            {
                total += line.Precio;
            }
            accessData.addOrder(email, total, orderLines);
        }


        public Boolean InsertPlate(String name, String description, String price, ref byte[] photo, String enabled, String timeToPrepare)
        {
            if (validation.EmptyValidation(name) || validation.LengthValidation(name) > 50 || validation.TextFiedValidation(name))
            {
                throw new ArgumentException("El espacio de nombre está vacio, sobrepasa el máximo de caracteres permitidos o está compuesta por solo números");
            }

            if (validation.EmptyValidation(description) || validation.LengthValidation(description) > 250 || validation.TextFiedValidation(description))
            {
                throw new ArgumentException("El espacio de descripción está vacio, sobrepasa el máximo de caracteres permitidos o está compuesto de solo números");
            }

            if (validation.EmptyValidation(price) || validation.NumericFieldValidation(price))
            {
                throw new ArgumentException("El espacio de precio está vacio o no está compuesto solo por números");
            }

            if (validation.EmptyValidation(enabled) || validation.LengthValidation(enabled) > 1)
            {
                throw new ArgumentException("El espacio de habilitación está vacio");
            }

            if (validation.EmptyValidation(timeToPrepare) || validation.NumericFieldValidation(timeToPrepare))
            {
                throw new ArgumentException("El espacio de tiempo de preparación está vacio o no contiene solo números");
            }

            if (photo == null)
            {
                throw new ArgumentNullException("No seleccionó una fotografia");
            }


            return InsertP(name, description, price, ref photo, enabled, timeToPrepare);
        }

        private Boolean InsertP(String name, String description, String price, ref byte[] fotografia, String enable, String time)
        {
            plate.Nombre = name;
            plate.Descripcion = description;
            plate.Precio = decimal.Parse(price);
            plate.HabilitadoSN = enable;
            plate.TiempoPreparacionMinutos = byte.Parse(time);
            plate.Fotografia = fotografia;

            return accessData.InsertPlate(plate);
        }

        public Boolean ModifiyPlate(String idToFind, String newName, String newDescription, String newPrice, ref byte[] newPhoto, String newEnabled, String newTimeToPrepare)
        {
            if (validation.TextFiedValidation(newName))
            {
                throw new ArgumentException("El nombre no tiene un formato correcto");
            }

            if (validation.TextFiedValidation(newDescription))
            {
                throw new ArgumentException("La descripción no tiene un formato correcto");
            }

            if (validation.NumericFieldValidation(newPrice))
            {
                throw new ArgumentException("El precio debe estar compuesto solo por números");
            }

            if (validation.NumericFieldValidation(newTimeToPrepare))
            {
                throw new ArgumentException("El tiempo de preparación debe estar compuesto solo por números");
            }

            return modifyP(idToFind, newName, newDescription, newPrice, ref newPhoto, newEnabled, newTimeToPrepare);
        }

        private Boolean modifyP(String idToFind, String newName, String newDescription, String newPrice, ref byte[] newPhoto, String newEnabled, String newTime)
        {
            // plate = SearchPlateName(nameToSearch);
            plate = SearchPlatoID(idToFind);

            if (!validation.EmptyValidation(newName) && validation.LengthValidation(newName) <= 50)
            {
                plate.Nombre = newName;
            }

            if (!validation.EmptyValidation(newDescription) && validation.LengthValidation(newDescription) <= 250)
            {
                plate.Descripcion = newDescription;
            }

            if (!validation.EmptyValidation(newPrice))
            {
                plate.Precio = decimal.Parse(newPrice);
            }

            if (newPhoto.Length != 0)
            {
                plate.Fotografia = newPhoto;
            }

            if (!validation.EmptyValidation(newEnabled))
            {
                plate.HabilitadoSN = newEnabled;
            }

            if (!validation.EmptyValidation(newTime))
            {
                plate.TiempoPreparacionMinutos = byte.Parse(newTime);
            }

            return accessData.ModifyPlate(plate);
        }

        private LineaOrden CreateLine(int plateID, int quantity)
        {

            LineaOrden line = new LineaOrden();
            line.PlatoID = plateID;
            line.Cantidad = quantity;

            return line;

        }

        public void AddOrderLine(String plateID, String quantity, List<LineaOrden> orderLines)
        {
            int userQuantity = int.Parse(quantity);
            int id = int.Parse(plateID);
            int varExist = 0;


            if (validation.NumericFieldValidation(quantity) || userQuantity < 0)
            {
                throw new Exception("El formato de la cantidad escogida no es correcto");
            }
            else
            {
                if (orderLines.Count != 0)
                {
                    for (int i = 0; i < orderLines.Count; i++) {
                        LineaOrden line = orderLines[i];



                        if (line.PlatoID == id)
                        {
                            
                            //Plato ya existe y entonces modifica la cantidad sumandole la cantidad del nuevo plato
                            line.Cantidad = line.Cantidad + userQuantity;
                            varExist = 1;
                            
                        }
                        

                    }
                    if (varExist < 1) {
                        orderLines.Add(CreateLine(id, userQuantity));
                    }
                }
                else
                {
                   //Primer plato a la orden 
                    orderLines.Add(CreateLine(id, userQuantity));

                }

            }
        }

        public void DeleteLine(List<LineaOrden> orderLines, String id)
        {
            int plateId = int.Parse(id);
            for (int i = 0; i < orderLines.Count; i++) 
            {
                LineaOrden line = orderLines[i];
                if (line.PlatoID == plateId)
                {
                    orderLines.Remove(line);
                }
            }
        }



        public DataTable SearchPlateName(String name)
        {
            if (validation.EmptyValidation(name) || validation.TextFiedValidation(name))
            {
                throw new ArgumentException("El formato del nombre no es correcto");
            }

            DataTable dtPlates = new DataTable();
            dtPlates.Columns.Add("Id");
            dtPlates.Columns.Add("Nombre");
            dtPlates.Columns.Add("Descripcion");
            dtPlates.Columns.Add("Precio");
            dtPlates.Columns.Add("Tiempo Preparación");
            dtPlates.Columns.Add("Habilitación");
            String habilitation;

            foreach (PROC_BUSCAR_NOMBRE_PLATO_Result plate in accessData.SearchByName(name))
            {
                if (plate.HabilitadoSN.ToUpper().Equals("S"))
                {
                    habilitation = "Si";
                }
                else
                {
                    habilitation = "No";
                }
                dtPlates.Rows.Add(plate.PlatoID, plate.Nombre, plate.Descripcion, plate.Precio, plate.TiempoPreparacionMinutos, habilitation);
            }
            return dtPlates;
        }

        public DataTable SearchPlateNameForClient(String name)
        {
            if (validation.EmptyValidation(name) || validation.TextFiedValidation(name))
            {
                throw new ArgumentException("El formato del nombre no es correcto");
            }

            DataTable dtPlates = new DataTable();

            dtPlates.Columns.Add("Nombre");
            dtPlates.Columns.Add("Precio");


            foreach (PROC_BUSCAR_NOMBRE_PLATO_Result plate in accessData.SearchByName(name))
            {
                if (plate.HabilitadoSN.ToUpper().Equals("S"))
                {
                    dtPlates.Rows.Add(plate.Nombre, plate.Precio);
                }

            }
            return dtPlates;
        }

        public Plato SearchPlatoID(String id)
        {
            if (validation.EmptyValidation(id) || validation.NumericFieldValidation(id))
            {
                throw new ArgumentException("El formato del identificador no es correcto");
            }

            plate = accessData.SearchPlateID(int.Parse(id));
            if (plate != null)
            {
                return plate;
            }
            else
            {
                throw new Exception("No se encontró ese plato");
            }

        }

        public Boolean DeletePlate(String id)
        {
            if (validation.EmptyValidation(id) || validation.NumericFieldValidation(id))
            {
                throw new ArgumentException("El formato del nombre no es correcto");
            }

            plate = SearchPlatoID(id);
            if (plate != null)
            {
                return accessData.SearchRelationOfPlate(int.Parse(id));
            }
            throw new Exception("Este plato no existe");
        }

        //Los administradores ven todas las caracteristicas
        public DataTable ShowAllPlatesForAdm()
        {
            DataTable dtPlates = new DataTable();
            dtPlates.Columns.Add("CodigoPlato");
            dtPlates.Columns.Add("Nombre");
            dtPlates.Columns.Add("Descripcion");
            dtPlates.Columns.Add("Precio");
            dtPlates.Columns.Add("TiempoPreparacion");
            dtPlates.Columns.Add("Habilitado");
            //dtPlates.Columns.Add("Fotografia");
            String habilitation;

            foreach (Plato plate in accessData.ShowPlates())
            {

                if (plate.HabilitadoSN.ToUpper().Equals("S"))
                {
                    habilitation = "Si";
                }
                else
                {
                    habilitation = "No";
                }

                dtPlates.Rows.Add(plate.PlatoID, plate.Nombre, plate.Descripcion, plate.Precio, plate.TiempoPreparacionMinutos + " minutos", habilitation);

            }
            return dtPlates;
        }

        //Los clientes solo ven el nombre y precio
        public DataTable ShowAllPlatesForClient()
        {
            DataTable dtPlates = new DataTable();
            dtPlates.Columns.Add("Nombre");
            dtPlates.Columns.Add("Precio");

            foreach (Plato plate in accessData.ShowPlates())
            {
                if (plate.HabilitadoSN.ToUpper().Equals("S"))
                {
                    dtPlates.Rows.Add(plate.Nombre, plate.Precio);
                }
            }
            return dtPlates;
        }

        public DataTable ShowAllPlates()
        {
            DataTable dtPlates = new DataTable();
            dtPlates.Columns.Add("Id");
            dtPlates.Columns.Add("Nombre");
            dtPlates.Columns.Add("Descripcion");
            dtPlates.Columns.Add("Precio");
            dtPlates.Columns.Add("Tiempo Preparación");
            dtPlates.Columns.Add("Habilitación");
            // dtPlates.Columns.Add("Fotografia");


            foreach (Plato plate in accessData.ShowPlates())
            {
                dtPlates.Rows.Add(plate.PlatoID, plate.Nombre, plate.Descripcion, plate.Precio, plate.TiempoPreparacionMinutos, plate.HabilitadoSN);
            }
            return dtPlates;
        }

        /*Plates Finish*/

        /*Users Start*/
        /***************************************ADD********************************/

        public void addUser(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password, int typeOfUser, String enabled)
        {
            accessData.addUser(email, firstName, secondName,
                firstLastName, secondLastName, address, password, typeOfUser, enabled);
        }

        public void addCustumer(String email, String firstName, String secondName, String lastName1, String lastName2, String address, String password)
        {
            accessData.addCustumer(email, firstName, secondName, lastName1, lastName2, address, password);
        }

        public void addAdmin(String email, String firstName, String secondName, String lastName1, String lastName2, String address, String password)
        {
            accessData.addAdmin(email, firstName, secondName, lastName1, lastName2, address, password);
        }

        public void addChef(String email, String firstName, String secondName, String lastName1, String lastName2, String address, String password)
        {
            accessData.addChef(email, firstName, secondName, lastName1, lastName2, address, password);

        }

        /****************Delete*******************/

        public void deleteParty(String address)
        {
            accessData.deleteParty(address);
        }

        /**********************LOGIN*******************/
        public int authenticate(String email, String pass)
        {
            List<Party> list = accessData.getParty();

            foreach (Party party in list)
            {
                if (email == party.CorreoElectronico)
                {
                    if (pass == party.Contraseña)
                    {
                        return party.TipoParty;   /****Admin=1    Custumer=2    Chef=3 ****/
                    }
                }

            }
            return 0; /****************si no coincide retorna 0**************/
        }

        public string authenticateName(String email)
        {
            List<Party> list = accessData.getParty();

            foreach (Party party in list)
            {
                if (email == party.CorreoElectronico)
                { 
                   return (party.PrimerNombre + " " + party.PrimerApellido);   /****Admin=1    Custumer=2    Chef=3 ****/
                }

            }
            return ""; /****************si no coincide retorna 0**************/
        }


        /*************BLOCK BY EMAIL****************/
        public void blockCustumer(String email)
        {
            accessData.blockCustumer(email);
        }

        public void unblockCustumer(String email)
        {
            accessData.unblockCustumer(email);
        }


        /********************UPDATE*********************/

        public void updateParty(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password, int typeOfUser, String enabled)
        {
            accessData.updateParty(email, firstName, secondName, firstLastName, secondLastName, address, password, typeOfUser, enabled);
        }

        public void updateParty2(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password, String enabled)
        {
            accessData.updateParty2(email, firstName, secondName, firstLastName, secondLastName, address, password, enabled);
        }

        public void updateClientInformation(String email, String firstName, String secondName, String firstLastName, String secondLastName, String address, String password)
        {
            accessData.updateClientInformation(email, firstName, secondName, firstLastName, secondLastName, address, password);
        }


        /*****************SEARCH*********************/
        public DataTable getUsers()
        {
            return accessData.getUsers();
        }

        public DataTable SearchUsers(String name)
        {
            return accessData.SearchUsers(name);
        }

        public DataTable searchParty(String email)
        {
            return accessData.searchParty(email);
        }


        public List<string> searchPartyClientByEmail(string email) {
            List<string> list = new List<string>();

            Party client = accessData.searchPartyClient(email);

            list.Add(client.PrimerNombre);
            list.Add(client.SegundoNombre);
            list.Add(client.PrimerApellido);
            list.Add(client.SegundoApellido);
            list.Add(client.Direccion);
            list.Add(client.Contraseña);

            return list;
        }


        public List<string> searchPartyClientByEmailFullInf(string email)
        {
            List<string> list = new List<string>();

            Party client = accessData.searchPartyClient(email);

            list.Add(client.PrimerNombre);
            list.Add(client.SegundoNombre);
            list.Add(client.PrimerApellido);
            list.Add(client.SegundoApellido);
            list.Add(client.Direccion);
            list.Add(client.Contraseña);
            list.Add(client.Habilitado_S_N_);
            list.Add(client.TipoParty + "");

            return list;
        }
        /*Users Finish*/

        /*Management module - all orders and filters*/

        // load orders
        public List<PROC_ALL_ORDERS_Result> LoadAllOrders()
        {
            return accessData.LoadAllOrders();
        }

        // only email
        public List<PROC_FILTER_ORDERS_BY_EMAIL_Result> FilterByEmail(String email)
        {
            if (!validation.EmailValidation(email))
            {
                throw new ArgumentException("El formato del correo no es correcto");
            }
            List<PROC_FILTER_ORDERS_BY_EMAIL_Result> result = FilterByEmailP(email);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_EMAIL_Result> FilterByEmailP(String email)
        {
            return accessData.FilterByEmail(email);
        }

        // only date
        public List<PROC_FILTER_ORDERS_BY_DATE_Result> FilterByDate(DateTime firstDate, DateTime secondDate)
        {
            if (firstDate > secondDate)
            {
                throw new ArgumentException("La primera fecha no puede ser mayor que la segunda fecha");
            }
            List<PROC_FILTER_ORDERS_BY_DATE_Result> result = FilterByDateP(firstDate, secondDate);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_DATE_Result> FilterByDateP(DateTime firstDate, DateTime secondDate)
        {
            return accessData.FilterByDate(firstDate, secondDate);
        }

        // only state
        public List<PROC_FILTER_ORDERS_BY_STATE_Result> FilterByState(int state)
        {
            List<PROC_FILTER_ORDERS_BY_STATE_Result> result = FilterByStateP(state);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_STATE_Result> FilterByStateP(int state)
        {
            return accessData.FilterByState(state);
        }

        // email - date
        public List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_Result> FilterByEmail_Date(String email, DateTime firstDate, DateTime secondDate)
        {
            if (!validation.EmailValidation(email))
            {
                throw new ArgumentException("El formato del correo no es correcto");
            }
            if (firstDate > secondDate)
            {
                throw new ArgumentException("La primera fecha no puede ser mayor que la segunda fecha");
            }
            List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_Result> result = FilterByEmail_DateP(email, firstDate, secondDate);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_Result> FilterByEmail_DateP(String email, DateTime firstDate, DateTime secondDate)
        {
            return accessData.FilterByEmail_Date(email, firstDate, secondDate);
        }

        // email - state
        public List<PROC_FILTER_ORDERS_BY_EMAIL_STATE_Result> FilterByEmail_State(String email, int state)
        {
            if (!validation.EmailValidation(email))
            {
                throw new ArgumentException("El formato del correo no es correcto");
            }
            List<PROC_FILTER_ORDERS_BY_EMAIL_STATE_Result> result = FilterByEmail_StateP(email, state);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_EMAIL_STATE_Result> FilterByEmail_StateP(String email, int state)
        {
            return accessData.FilterByEmail_State(email, state);
        }

        // date - state
        public List<PROC_FILTER_ORDERS_BY_DATE_STATE_Result> FilterByDate_State(DateTime firstDate, DateTime secondDate, int state)
        {
            if (firstDate > secondDate)
            {
                throw new ArgumentException("La primera fecha no puede ser mayor que la segunda fecha");
            }
            List<PROC_FILTER_ORDERS_BY_DATE_STATE_Result> result = FilterByDate_StateP(firstDate, secondDate, state);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_DATE_STATE_Result> FilterByDate_StateP(DateTime firstDate, DateTime secondDate, int state)
        {
            return accessData.FilterByDate_State(firstDate, secondDate, state);
        }

        // email - date - state
        public List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_STATE_Result> FilterByEmail_Date_State(String email, DateTime firstDate, DateTime secondDate, int state)
        {
            if (!validation.EmailValidation(email))
            {
                throw new ArgumentException("El formato del correo no es correcto");
            }
            if (firstDate > secondDate)
            {
                throw new ArgumentException("La primera fecha no puede ser mayor que la segunda fecha");
            }
            List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_STATE_Result> result = FilterByEmail_Date_StateP(email, firstDate, secondDate, state);
            if (result.Count == 0)
            {
                throw new ArgumentException("No hay ordenes para los parametros seleccionados");
            }
            return result;
        }
        private List<PROC_FILTER_ORDERS_BY_EMAIL_DATE_STATE_Result> FilterByEmail_Date_StateP(String email, DateTime firstDate, DateTime secondDate, int state)
        {
            return accessData.FilterByEmail_Date_State(email, firstDate, secondDate, state);
        }

        public void changeStateOrder(int orderID, int stateID)
        {
            accessData.changeStateOrder(orderID, stateID);
        }

        public List<PROC_KITCHEN_ORDERS_Result> loadKitchenOrders()
        {
            return accessData.LoadKitchenOrders();
        }

        public void updateTimesToOrders(List<int> numOrders)
        {
            accessData.setTimesToOrders(numOrders);
        }

        public void deliverOrder(int orderID)
        {
            accessData.deliverOrder(orderID);
        }

        public void returnLastOrder(int orderID, int state)
        {
            accessData.returnLastOrder(orderID, state);
        }

        public Orden findOrder(int orderID)
        {
            return accessData.findOrder(orderID);
        }
    }
}
