using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace LigaLol
{
    public partial class Form1 : Form
    {
        private SqlConnection cn;
        private int totalItems;
        private string comandoConfirmar;
        private bool isAddMode = false;


        public Form1()
        {
            InitializeComponent();
            cn = getSGBDConnection();
            comandoConfirmar = string.Empty;
            verifySGBDConnection();
            InitializeJogadoresComboBox();
            LoadTeamNamesIntoComboBox();
            LoadTypesIntoComboBox();
            LoadStoresIntoComboBox();
            updateListaJogadores();
            updateListaCoaches();
            updateListaTeams();
            updateListaProducts();
            updateLiga();
            LoadLeaguesIntoComboBox();
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Server=tcp:andregui.database.windows.net,1433;Persist Security Info=False;User ID=andregui;Password=galinhas123!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void InitializeJogadoresComboBox()
        {
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox1.Items.Add("");
            comboBox1.Items.Add("Top");
            comboBox1.Items.Add("Jungle");
            comboBox1.Items.Add("Mid");
            comboBox1.Items.Add("ADC");
            comboBox1.Items.Add("Support");
            Roles_p.DropDownStyle = ComboBoxStyle.DropDownList;
            Roles_p.Items.Add("");
            Roles_p.Items.Add("Top");
            Roles_p.Items.Add("Jungle");
            Roles_p.Items.Add("Mid");
            Roles_p.Items.Add("ADC");
            Roles_p.Items.Add("Support");
            
            comboBox2.DropDownStyle = ComboBoxStyle.DropDownList;

            Team_teams_P.DropDownStyle = ComboBoxStyle.DropDownList;
            team_coach.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox3.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox3.Items.Add("");
            comboBox3.Items.Add("Ativo");
            comboBox3.Items.Add("Inativo");

            Role_Coach.DropDownStyle = ComboBoxStyle.DropDownList;
            Role_Coach.Items.Add("");
            Role_Coach.Items.Add("Psychologist");
            Role_Coach.Items.Add("Analyst");
            Role_Coach.Items.Add("Main Coach");

            team_drop_coach.DropDownStyle = ComboBoxStyle.DropDownList;
            Regiont.DropDownStyle = ComboBoxStyle.DropDownList;
            Regiont.Items.Add("");
            Regiont.Items.Add("EU");
            Regiont.Items.Add("NA");
            Regiont.Items.Add("KR");
            Regiont.Items.Add("CN");
            Regiont.Items.Add("BR");
            
            Stores.DropDownStyle = ComboBoxStyle.DropDownList;  
            Types.DropDownStyle = ComboBoxStyle.DropDownList;
            Teams.DropDownStyle = ComboBoxStyle.DropDownList;
           

            this.comboBox1.SelectedIndexChanged += new System.EventHandler(comboBox1_SelectedIndexChanged);
            this.comboBox2.SelectedIndexChanged += new System.EventHandler(comboBox2_SelectedIndexChanged);
            this.comboBox3.SelectedIndexChanged += new System.EventHandler(comboBox3_SelectedIndexChanged);
        }

        private void LoadStoresIntoComboBox()
        {
            try
            {
                if (verifySGBDConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT [Name] FROM LOL.Store", cn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Stores.Items.Clear();
                    Stores.Items.Add("");
                    while (reader.Read())
                    {
                        string storeName = reader["Name"].ToString();
                        Stores.Items.Add(storeName);
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao carregar lojas: {ex.Message}");
            }
        }
        private void LoadTeamNamesIntoComboBox()
        {
            try
            {
                if (verifySGBDConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT [Name] FROM LOL.Team", cn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    comboBox2.Items.Clear();
                    comboBox2.Items.Add("");
                    Team_teams_P.Items.Clear(); // Clear the Team dropdown
                    Team_teams_P.Items.Add(""); // Add a blank option
                    team_coach.Items.Clear();
                    team_coach.Items.Add("");
                    team_drop_coach.Items.Clear();
                    team_drop_coach.Items.Add("");
                    
                    Teams.Items.Clear();
                    Teams.Items.Add("");

                    while (reader.Read())
                    {
                        string teamName = reader["Name"].ToString();
                        comboBox2.Items.Add(teamName);
                        Team_teams_P.Items.Add(teamName);
                        team_coach.Items.Add(teamName);
                        team_drop_coach.Items.Add(teamName);
                        
                        Teams.Items.Add(teamName);
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao carregar nomes das equipes: {ex.Message}");
            }
        }
        private void LoadTypesIntoComboBox()
        {
            try
            {
                if (verifySGBDConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT [Types] FROM LOL.Product", cn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Types.Items.Clear();
                    Types.Items.Add("");
                    while (reader.Read())
                    {
                        string type = reader["Types"].ToString();
                        Types.Items.Add(type);
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao carregar tipos de lojas: {ex.Message}");
            }
        }
        private void LoadLeaguesIntoComboBox()
        {
            try
            {
                if (verifySGBDConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT [Name] FROM LOL.League", cn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    FilterLeagueT.Items.Clear();
                    FilterLeagueT.Items.Add("");
                    while (reader.Read())
                    {
                        string leagueName = reader["Name"].ToString();
                        FilterLeagueT.Items.Add(leagueName);
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao carregar ligas: {ex.Message}");
            }
        }
        



        private void comboBox1_SelectedIndexChanged(object? sender, EventArgs e)
        {
            FiltrarJogadores();
        }

        private void comboBox2_SelectedIndexChanged(object? sender, EventArgs e)
        {
            FiltrarJogadores();
        }

        private void comboBox3_SelectedIndexChanged(object? sender, EventArgs e)
        {
            FiltrarJogadores();
        }

        private void searchname(object sender, EventArgs e)
        {
            // Seu cÃ³digo aqui para o evento searchname
        }

        private void updateListaJogadores()
        {
            totalItems = 0;

            Player_list.Items.Clear();
            SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.Player", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Player player = new Player();
                player.CCNumber = (int)reader["CCNumber"];
                player.Nickname = reader["nickname"]?.ToString() ?? string.Empty;
                player.RealName = reader["realname"]?.ToString() ?? string.Empty;
                player.Roles = reader["Roles"]?.ToString() ?? string.Empty;
                player.Ranks = reader["Ranks"]?.ToString() ?? string.Empty;
                player.MainChampion = reader["MainChampion"]?.ToString() ?? string.Empty;
                player.Earnings = reader["earnings"] != DBNull.Value ? Convert.ToDouble(reader["earnings"]) : 0.0;

                totalItems++;
                Player_list.Items.Add(player.Nickname);  // Exibe o nickname na lista
            }
            label23.Text = "Total de jogadores: " + totalItems.ToString();
            reader.Close();

            this.Player_list.SelectedIndexChanged += new System.EventHandler(this.Lista_Jogadores_SelectedIndexChanged);
        }

        private void Lista_Jogadores_SelectedIndexChanged(object? sender, EventArgs e)
        {
            if (Player_list.SelectedItem is string selectedNickname)
            {
                // Modify the query to select from the view
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM LOL.FilterPlayers WHERE nickname = @nickname", cn);

                cmd.Parameters.AddWithValue("@nickname", selectedNickname);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    textBoxCCNumber.Text = reader["CCNumber"].ToString();
                    textBoxNickname.Text = reader["nickname"].ToString();
                    textBoxRealName.Text = reader["realname"].ToString();
                    Roles_p.Text = reader["Roles"].ToString();
                    textBoxRanks.Text = reader["Ranks"].ToString();
                    textBoxMainChampion.Text = reader["MainChampion"].ToString();
                    textBoxEarnings.Text = reader["earnings"].ToString();
                    Team_teams_P.Text = reader["teamname"].ToString();
                    Age_P.Text = reader["Age"].ToString(); // Assuming you have a textbox for Age
                }
                reader.Close();
                UpdateContractDetails(selectedNickname);
                UpdateAverageIndividualStatistics(selectedNickname);
                buttonDelete.Visible = true;
                buttonUpdate.Visible = true;
            }
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            if (!isAddMode)
            {
                // Set to Add Mode
                isAddMode = true;
                buttonAdd.Text = "Confirm Add";
                
                // Show the date pickers and contract ID field
                Initial_time_date_picker1.Visible = true;
                final_date_picker_2.Visible = true;
                Initial_date.Visible = true;
                final_date.Visible = true;
                Contract_id_p.Visible = true;
                contract_id_t.Visible = true;
            }
            else
            {
                // Confirm Add Mode
                isAddMode = false;
                buttonAdd.Text = "Add";
                
                // Execute Add Logic
                ExecuteAddOrUpdatePlayer();
                
                // Hide the date pickers and contract ID field
                Initial_time_date_picker1.Visible = false;
                final_date_picker_2.Visible = false;
                Initial_date.Visible = false;
                final_date.Visible = false;
                Contract_id_p.Visible = false;
                contract_id_t.Visible = false;

                // Clear the form
                clear("jogadores", "limpar");
            }
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            comandoConfirmar = "alterar";
            ExecuteAddOrUpdatePlayer();
        }
        
        
      private void ExecuteAddOrUpdatePlayer()
{
    try
    {
        if (verifySGBDConnection())
        {
            int ccNumber = int.Parse(textBoxCCNumber.Text);
            string nickname = textBoxNickname.Text;
            string realName = textBoxRealName.Text;
            int age = int.Parse(Age_P.Text);
            string roles = Roles_p.Text;
            string ranks = textBoxRanks.Text;
            string mainChampion = textBoxMainChampion.Text;
            double earnings = double.Parse(textBoxEarnings.Text);
            string teamName = Team_teams_P.Text;
            int contractId = int.Parse(contract_id_t.Text);

            DateTime initialDate = Initial_date_P_picker.Value;
            DateTime finalDate = final_date_picker.Value;

            // Check if team exists
            SqlCommand checkTeamCmd = new SqlCommand("SELECT COUNT(*) FROM LOL.Team WHERE Name = @TeamName", cn);
            checkTeamCmd.Parameters.AddWithValue("@TeamName", teamName);
            int teamExists = (int)checkTeamCmd.ExecuteScalar();

            if (teamExists == 0)
            {
                MessageBox.Show($"Team '{teamName}' does not exist. Please enter a valid team name.");
                return;
            }

            // Ensure Person exists
            SqlCommand personCmd = new SqlCommand("LOL.AddOrUpdatePerson", cn);
            personCmd.CommandType = CommandType.StoredProcedure;
            personCmd.Parameters.Add(new SqlParameter("@CCNumber", ccNumber));
            personCmd.Parameters.Add(new SqlParameter("@Name", realName));
            personCmd.Parameters.Add(new SqlParameter("@Age", age));
            personCmd.ExecuteNonQuery();

            // Add or update Player and contract details
            SqlCommand playerCmd = new SqlCommand("LOL.AddOrUpdatePlayer", cn);
            playerCmd.CommandType = CommandType.StoredProcedure;
            playerCmd.Parameters.Add(new SqlParameter("@CCNumber", ccNumber));
            playerCmd.Parameters.Add(new SqlParameter("@Nickname", nickname));
            playerCmd.Parameters.Add(new SqlParameter("@RealName", realName));
            playerCmd.Parameters.Add(new SqlParameter("@Roles", roles));
            playerCmd.Parameters.Add(new SqlParameter("@Ranks", ranks));
            playerCmd.Parameters.Add(new SqlParameter("@MainChampion", mainChampion));
            playerCmd.Parameters.Add(new SqlParameter("@Earnings", earnings));
            playerCmd.Parameters.Add(new SqlParameter("@TeamName", teamName));
            playerCmd.Parameters.Add(new SqlParameter("@Command", comandoConfirmar));
            playerCmd.Parameters.Add(new SqlParameter("@ContractID", contractId));
            playerCmd.Parameters.Add(new SqlParameter("@StartDate", initialDate));
            playerCmd.Parameters.Add(new SqlParameter("@EndDate", finalDate));
            playerCmd.ExecuteNonQuery();

            MessageBox.Show($"Jogador {comandoConfirmar} com sucesso!");

            // Clear the form
            clear("jogadores", "limpar");
            updateListaJogadores();

            // Reset the button text to "Add" or "Update"
            if (comandoConfirmar == "adicionar")
            {
                buttonAdd.Text = "Add";
            }
            else if (comandoConfirmar == "alterar")
            {
                buttonUpdate.Text = "Update";
            }
            isAddMode = false;

            // Fetch and update contract details in the UI
            UpdateContractDetails(nickname);
        }
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Erro ao {comandoConfirmar} jogador! {ex.Message}");
        Console.WriteLine(ex.ToString());
    }
}

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("LOL.DeletePlayer", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@CCNumber", textBoxCCNumber.Text));
                SqlDataReader reader = cmd.ExecuteReader();
                MessageBox.Show("Jogador apagado com sucesso!");
                reader.Close();
                clear("jogadores", "limpar");
                updateListaJogadores();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao apagar jogador! {ex.Message}");
            }
        }

        private void FiltrarJogadores()
        {
            string roles = comboBox1.Text;
            string team = comboBox2.Text;
            string activeStatus = comboBox3.Text;
            string nickname = textBoxpesquisanick.Text;

            string query = "SELECT * FROM LOL.FilterPlayers WHERE 1=1";

            if (!string.IsNullOrEmpty(roles))
            {
                query += " AND Roles = @Roles";
            }

            if (!string.IsNullOrEmpty(team))
            {
                query += " AND teamname = @Team";
            }

            if (!string.IsNullOrEmpty(activeStatus))
            {
                if (activeStatus == "Ativo")
                {
                    query += " AND ContractStatus = 'Sim'";
                }
                else if (activeStatus == "Inativo")
                {
                    query += " AND ContractStatus = 'Nao'";
                }
            }

            if (!string.IsNullOrEmpty(nickname))
            {
                query += " AND nickname LIKE @Nickname";
            }

            SqlCommand cmd = new SqlCommand(query, cn);

            if (!string.IsNullOrEmpty(roles))
            {
                cmd.Parameters.AddWithValue("@Roles", roles);
            }
            if (!string.IsNullOrEmpty(team))
            {
                cmd.Parameters.AddWithValue("@Team", team);
            }
            if (!string.IsNullOrEmpty(activeStatus))
            {
                cmd.Parameters.AddWithValue("@Contract", activeStatus);
            }
            if (!string.IsNullOrEmpty(nickname))
            {
                cmd.Parameters.AddWithValue("@Nickname", "%" + nickname + "%");
            }

            SqlDataReader reader = cmd.ExecuteReader();
            Player_list.Items.Clear();
            totalItems = 0;
            while (reader.Read())
            {
                string nicknameResult = reader["nickname"]?.ToString() ?? string.Empty;
                totalItems++;
                Player_list.Items.Add(nicknameResult);  // Exibe o nickname na lista
            }
            label23.Text = "Total de jogadores: " + totalItems.ToString();
            reader.Close();
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            FiltrarJogadores();
        }

        private void UpdateContractDetails(string nickname)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.ContractDetails WHERE nickname = @nickname", cn);
            cmd.Parameters.AddWithValue("@nickname", nickname);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string contractDetails = $"Contract ID: {reader["ContractID"]}, Start Date: {reader["StartDate"]}, End Date: {reader["EndDate"]}";
                textBoxContractDetails.Text = contractDetails;
            }
            reader.Close();
        }


        private void Estatistica_Jogador_TextChanged(object sender, EventArgs e)
        {
            // Manipular evento de texto alterado de Estatistica_Jogador, se necessÃ¡rio
        }
        private void UpdateAverageIndividualStatistics(string nickname)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.AverageIndividualStatisticsDetails WHERE nickname = @nickname", cn);
            cmd.Parameters.AddWithValue("@nickname", nickname);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                textBoxEstatisticaMedia.Text = $"Assists: {reader["Assists"]}, Baron: {reader["Baron"]}, Drakes: {reader["Drakes"]}, Gold: {reader["Gold"]}, Kills: {reader["Kills"]}, Deaths: {reader["Deaths"]}, Towers: {reader["Towers"]}, Inibs: {reader["Inibs"]}";
            }
            reader.Close();
        }
        private void buttonDelete_Click_1(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("LOL.DeletePlayer", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@CCNumber", textBoxCCNumber.Text));
                SqlDataReader reader = cmd.ExecuteReader();
                MessageBox.Show("Jogador apagado com sucesso!");
                reader.Close();
                clear("jogadores", "limpar");
                updateListaJogadores();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao apagar jogador! {ex.Message}");
            }
        }
        private void clear(string section, string action)
{
    if (section == "jogadores" && action == "limpar")
    {
        textBoxCCNumber.Text = string.Empty;
        textBoxNickname.Text = string.Empty;
        team_id_t.Text = string.Empty;
        textBoxRealName.Text = string.Empty;
        Age_P.Text = string.Empty;
        Roles_p.Text = string.Empty;
        textBoxRanks.Text = string.Empty;
        textBoxMainChampion.Text = string.Empty;
        textBoxEarnings.Text = string.Empty;
        textBoxEstatisticaMedia.Text = string.Empty;
        textBoxContractDetails.Text = string.Empty;
        Team_teams_P.Text = string.Empty;
        comboBox2.Text = string.Empty;
        comboBox1.Text = string.Empty;
        comboBox3.Text = string.Empty;

        // Hide the date pickers and contract ID field
        Initial_date_P_picker.Visible = false;
        final_date_picker.Visible = false;
        Initial_date_P.Visible = false;
        final_date_P.Visible = false;
        Contract_id_p.Visible = false;
        contract_id_t.Visible = false;

        // Reset the button text to default
        buttonAdd.Text = "Add";
        buttonUpdate.Text = "Update";
        isAddMode = false;
    }
    else if (section == "coaches" && action == "limpar")
    {
        CC_Number_coachs.Text = string.Empty;
        Name_coachs.Text = string.Empty;
        Age_Coachs.Text = string.Empty;
        textBox1.Text = string.Empty;
        team_coach.Text = string.Empty;
        Role_Coach.Text = string.Empty;
        Contract_details_Coachs.Text = string.Empty;
        team_drop_coach.Text = string.Empty;

        // Hide the date pickers and contract ID field
        Initial_time_date_picker1.Visible = false;
        final_date_picker_2.Visible = false;
        Initial_date.Visible = false;
        final_date.Visible = false;

        // Reset the button text to default
        Add_Coach.Text = "Add";
        update_coachs.Text = "Update";
        isAddMode = false;
    }
    else if (section == "teams" && action == "limpar")
    {
        textBox2.Text = string.Empty;
        textBox3.Text = string.Empty;
        textBox4.Text = string.Empty;
        pointst.Text = string.Empty;
        positiont.Text = string.Empty;
        textBox5.Text = string.Empty;
        numberofgamest.Text = string.Empty;
        sponsorst.Text = string.Empty;
        totalearningst.Text = string.Empty;
        Regiont.Text = string.Empty;
        team_id_t.Text = string.Empty;
        Average_S.Text = string.Empty;
        team_gamest.Text = string.Empty;
        FilterLeagueT.Text = string.Empty;

        // Reset the button text to default
        Confirmar_addt.Text = "Add";
        Confirmar_addt.Visible = false;
        Cancel_addt.Visible = false;
        isAddMode = false;
    }
    else if (section == "store" && action == "limpar")
    {
        StoreID.Text = string.Empty;
        ProductS.Text = string.Empty;
        priceS.Text = string.Empty;
        SizesS.Text = string.Empty;
        Types.SelectedIndex = -1;
        Stocks.Text = string.Empty;
        Stores.Text = string.Empty;
        Teams.Text = string.Empty;
        textBox6.Text = string.Empty;
        productids.Text = string.Empty;
        Types.Text = string.Empty;
        typel.Text = string.Empty;
        Teams.SelectedIndex = -1;
        

        // Reset the button text to default
        Add_S.Text = "Add";
        Delete_S.Text = "Delete";
        isAddMode = false;
    }
    else if (section == "league" && action == "limpar")
    {
        League_ID_L.Text = string.Empty;
        LeagueNameL.Text = string.Empty;
        PointsL.Text = string.Empty;
        PositionL.Text = string.Empty;
        Win_rateL.Text = string.Empty;
        Number_of_games_L.Text = string.Empty;
        Team_L.Items.Clear();
        GamesL.Items.Clear();
        Individual_StatistricsL.Text = string.Empty;
        gameid.Text = string.Empty;
        TimeL.Text = string.Empty;
        Winner_Of_Game_L.Text = string.Empty;
    }
    else if (section == "league" && action == "semiclear")
    {
        PointsL.Text = string.Empty;
        PositionL.Text = string.Empty;
        Win_rateL.Text = string.Empty;
        Number_of_games_L.Text = string.Empty;
        Team_L.Items.Clear();
        GamesL.Items.Clear();
        Individual_StatistricsL.Text = string.Empty;
    }
    else if (section == "team" && action == "semiclear")
    {
        GamesL.Items.Clear();
        Individual_StatistricsL.Text = string.Empty;
        gameid.Text = string.Empty;
        TimeL.Text = string.Empty;
        Winner_Of_Game_L.Text = string.Empty;
    }
}

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void ButtonDelete_Click_1(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("LOL.DeletePlayer", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@CCNumber", textBoxCCNumber.Text));
                cmd.ExecuteNonQuery();
                MessageBox.Show("Jogador apagado com sucesso!");
                clear("jogadores", "limpar");
                updateListaJogadores();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao apagar jogador! {ex.Message}");
            }
        }

        private void labelRoles_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void buttonSearch_Click_1(object sender, EventArgs e)
        {

        }

        private void buttonAdd_Click_1(object sender, EventArgs e)
        {
            
            if (!isAddMode)
            {
                // Set to Add Mode
                clear("jogadores", "limpar");
                isAddMode = true;
                buttonAdd.Text = "Confirm Add";
                
                // Show the date pickers and contract ID field
                Initial_date_P_picker.Visible = true;
                final_date_picker.Visible = true;
                Initial_date_P.Visible = true;
                final_date_P.Visible = true;
                Contract_id_p.Visible = true;
                contract_id_t.Visible = true;
            }
            else
            {
                // Validate inputs
                if (string.IsNullOrWhiteSpace(textBoxCCNumber.Text) ||
                    string.IsNullOrWhiteSpace(textBoxNickname.Text) ||
                    string.IsNullOrWhiteSpace(textBoxRealName.Text) ||
                    string.IsNullOrWhiteSpace(Roles_p.Text) ||
                    string.IsNullOrWhiteSpace(textBoxRanks.Text) ||
                    string.IsNullOrWhiteSpace(textBoxMainChampion.Text) ||
                    string.IsNullOrWhiteSpace(textBoxEarnings.Text) ||
                    string.IsNullOrWhiteSpace(Team_teams_P.Text) ||
                    string.IsNullOrWhiteSpace(contract_id_t.Text) ||
                    !double.TryParse(textBoxEarnings.Text, out _) ||
                    !int.TryParse(textBoxCCNumber.Text, out _) ||
                    !int.TryParse(contract_id_t.Text, out _))
                {
                    MessageBox.Show("Please ensure all fields are filled correctly and try again.");
                    return;
                }

                // Confirm Add Mode
                isAddMode = false;
                buttonAdd.Text = "Add";
                
                // Execute Add Logic
                comandoConfirmar = "adicionar";
                ExecuteAddOrUpdatePlayer();

                // Hide the date pickers and contract ID field
                Initial_date_P_picker.Visible = false;
                final_date_picker.Visible = false;
                Initial_date_P.Visible = false;
                final_date_P.Visible = false;
                Contract_id_p.Visible = false;
                contract_id_t.Visible = false;

                // Clear the form
                clear("jogadores", "limpar");
            }
        }

        private void textBoxpesquisanick_TextChanged(object sender, EventArgs e)
        {

        }
        //UPDATE
        private void button5_Click(object sender, EventArgs e)
        {
            clear("jogadores", "limpar");
            updateListaJogadores();
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            clear("jogadores", "limpar");
            updateListaJogadores();
        }

        private void buttonSearch_Click_2(object sender, EventArgs e)
        {
            FiltrarJogadores();
        }
         private void labelSearchName_Click(object sender, EventArgs e)
        {

        }

        private void buttonUpdate_Click_1(object sender, EventArgs e)
        {
            if (!isAddMode)
            {
                isAddMode = true;
                buttonUpdate.Text = "Confirm Update";

                Initial_date_P_picker.Visible = true;
                final_date_picker.Visible = true;
                Initial_date_P.Visible = true;
                final_date_P.Visible = true;
                Contract_id_p.Visible = true;
                contract_id_t.Visible = true;
            }
            else
            {
                if (string.IsNullOrWhiteSpace(textBoxCCNumber.Text) ||
                    string.IsNullOrWhiteSpace(textBoxNickname.Text) ||
                    string.IsNullOrWhiteSpace(textBoxRealName.Text) ||
                    string.IsNullOrWhiteSpace(Roles_p.Text) ||
                    string.IsNullOrWhiteSpace(textBoxRanks.Text) ||
                    string.IsNullOrWhiteSpace(textBoxMainChampion.Text) ||
                    string.IsNullOrWhiteSpace(textBoxEarnings.Text) ||
                    string.IsNullOrWhiteSpace(Team_teams_P.Text) ||
                    string.IsNullOrWhiteSpace(contract_id_t.Text) ||
                    !double.TryParse(textBoxEarnings.Text, out _) ||
                    !int.TryParse(textBoxCCNumber.Text, out _) ||
                    !int.TryParse(contract_id_t.Text, out _))
                {
                    MessageBox.Show("Please ensure all fields are filled correctly and try again.");
                    return;
                }

                isAddMode = false;
                buttonUpdate.Text = "Update";

                comandoConfirmar = "alterar";
                ExecuteAddOrUpdatePlayer();

                Initial_date_P_picker.Visible = false;
                final_date_picker.Visible = false;
                Initial_date_P.Visible = false;
                final_date_P.Visible = false;
                Contract_id_p.Visible = false;
                contract_id_t.Visible = false;

                clear("jogadores", "limpar");
            }
        }

        private void Team_players_Click(object sender, EventArgs e)
        {

        }

        private void Team_teams_P_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void label5_Click(object sender, EventArgs e)
        {

        }
        private void label9_Click(object sender, EventArgs e)
        {

        }
        
        
        
        private void contract_id_t_TextChanged(object sender, EventArgs e)
        {

        }
        
        private void ShowCoachInfo_Click(object sender, EventArgs e)
        {
            
        }
        
        private void UpdateContractDetailsCoach(string realName)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.CoachDetails WHERE RealName = @RealName", cn);
            cmd.Parameters.AddWithValue("@RealName", realName);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string contractDetails = $"Contract ID: {reader["ContractID"]}, Start Date: {reader["StartDate"]}, End Date: {reader["EndDate"]}";
                Contract_details_Coachs.Text = contractDetails;
            }
            reader.Close();
        }

       private void ExecuteAddOrUpdateCoach()
    {
        try
        {
            if (verifySGBDConnection())
            {
                int ccNumber = int.Parse(CC_Number_coachs.Text);
                string realName = Name_coachs.Text;
                int age = int.Parse(Age_Coachs.Text);
                int contractId = int.Parse(textBox1.Text);
                string role = Role_Coach.Text;
                string teamName = team_coach.Text; // Get the selected team
                DateTime initialDate = Initial_time_date_picker1.Value;
                DateTime finalDate = final_date_picker_2.Value;

                // Ensure Person exists
                SqlCommand personCmd = new SqlCommand("LOL.AddOrUpdatePerson", cn);
                personCmd.CommandType = CommandType.StoredProcedure;
                personCmd.Parameters.Add(new SqlParameter("@CCNumber", ccNumber));
                personCmd.Parameters.Add(new SqlParameter("@Name", realName));
                personCmd.Parameters.Add(new SqlParameter("@Age", age));
                personCmd.ExecuteNonQuery();

                // Add or update Coach and contract details
                SqlCommand coachCmd = new SqlCommand("LOL.AddOrUpdateCoach", cn);
                coachCmd.CommandType = CommandType.StoredProcedure;
                coachCmd.Parameters.Add(new SqlParameter("@CCNumber", ccNumber));
                coachCmd.Parameters.Add(new SqlParameter("@RealName", realName));
                coachCmd.Parameters.Add(new SqlParameter("@Age", age));
                coachCmd.Parameters.Add(new SqlParameter("@ContractID", contractId));
                coachCmd.Parameters.Add(new SqlParameter("@Role", role));
                coachCmd.Parameters.Add(new SqlParameter("@StartDate", initialDate));
                coachCmd.Parameters.Add(new SqlParameter("@EndDate", finalDate));
                coachCmd.Parameters.Add(new SqlParameter("@Command", comandoConfirmar));
                coachCmd.Parameters.Add(new SqlParameter("@TeamName", teamName)); // Pass the team name to the procedure
                coachCmd.ExecuteNonQuery();

                MessageBox.Show($"Treinador {comandoConfirmar} com sucesso!");

                // Clear the form
                clear("coaches", "limpar");
                updateListaCoaches();

                // Reset the button text to "Add" or "Update"
                if (comandoConfirmar == "adicionar")
                {
                    Add_Coach.Text = "Add";
                }
                else if (comandoConfirmar == "alterar")
                {
                    update_coachs.Text = "Update";
                }
                isAddMode = false;

                // Fetch and update contract details in the UI
                UpdateContractDetailsCoach(realName);
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Erro ao {comandoConfirmar} treinador! {ex.Message}");
            Console.WriteLine(ex.ToString());
        }
    }
        //
        private void updateListaCoaches()
        {
            totalItems = 0;

            Coachs_List.Items.Clear();
            SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.CoachDetails", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string realName = reader["RealName"]?.ToString() ?? string.Empty;
                totalItems++;
                Coachs_List.Items.Add(realName);  // Display the real name in the list
            }
            label6.Text = "Total de treinadores: " + totalItems.ToString();
            reader.Close();

            this.Coachs_List.SelectedIndexChanged += new System.EventHandler(this.Lista_Coaches_SelectedIndexChanged);
        }
        

        private void Lista_Coaches_SelectedIndexChanged(object sender, EventArgs e)
{
    if (Coachs_List.SelectedItem is string selectedRealName)
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.CoachDetails WHERE RealName = @RealName", cn);
        cmd.Parameters.AddWithValue("@RealName", selectedRealName);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            CC_Number_coachs.Text = reader["CCNumber"].ToString();
            Name_coachs.Text = reader["RealName"].ToString();
            Age_Coachs.Text = reader["Age"].ToString();
            textBox1.Text = reader["ContractID"].ToString();
            team_coach.Text = reader["TeamName"].ToString();
            Role_Coach.Text = reader["Role"].ToString();
            Initial_time_date_picker1.Value = (DateTime)reader["StartDate"];
            final_date_picker_2.Value = (DateTime)reader["EndDate"];
            Contract_details_Coachs.Text = $"Contract ID: {reader["ContractID"]}, Start Date: {reader["StartDate"]}, End Date: {reader["EndDate"]}";
        }
        reader.Close();
        delete_coachs.Visible = true;
        update_coachs.Visible = true;
    }
}
        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void Search_coachs_TextChanged(object sender, EventArgs e)
        {

        }

        private void Coachs_List_SelectedIndexChanged (object sender, EventArgs e)
        {
            
        }
        private void delete_coachs_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("LOL.DeleteCoach", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@CCNumber", CC_Number_coachs.Text));
                SqlDataReader reader = cmd.ExecuteReader();
                MessageBox.Show("Treinador apagado com sucesso!");
                reader.Close();
                clear("coaches", "limpar");
                updateListaCoaches();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erro ao apagar treinador! {ex.Message}");
            }
        }
        private void update_coachs_Click(object sender, EventArgs e)
{
    if (!isAddMode)
    {
        // Set to Update Mode
        isAddMode = true;
        update_coachs.Text = "Confirm Update";

        // Show the date pickers and contract ID field
        Initial_time_date_picker1.Visible = true;
        final_date_picker_2.Visible = true;
        Initial_date.Visible = true;
        final_date.Visible = true;
    }
    else
    {
        // Validate inputs
        if (string.IsNullOrWhiteSpace(CC_Number_coachs.Text) ||
            string.IsNullOrWhiteSpace(Name_coachs.Text) ||
            string.IsNullOrWhiteSpace(Age_Coachs.Text) ||
            string.IsNullOrWhiteSpace(textBox1.Text) ||
            !int.TryParse(Age_Coachs.Text, out _) ||
            !int.TryParse(CC_Number_coachs.Text, out _) ||
            !int.TryParse(textBox1.Text, out _))
        {
            MessageBox.Show("Please ensure all fields are filled correctly and try again.");
            return;
        }

        // Confirm Update Mode
        isAddMode = false;
        update_coachs.Text = "Update";

        // Execute Update Logic
        comandoConfirmar = "alterar";
        ExecuteAddOrUpdateCoach();

        // Hide the date pickers and contract ID field
        Initial_time_date_picker1.Visible = false;
        final_date_picker_2.Visible = false;
        Initial_date.Visible = false;
        final_date.Visible = false;

        // Clear the form
        clear("coaches", "limpar");
    }
}
        private void Add_Coach_Click(object sender, EventArgs e)
        {
            if (!isAddMode)
            {
                clear("coaches", "limpar");
                // Set to Add Mode
                isAddMode = true;
                Add_Coach.Text = "Confirm Add";
                
                // Show the date pickers and contract ID field
                Initial_time_date_picker1.Visible = true;
                final_date_picker_2.Visible = true;
                Initial_date.Visible = true;
                final_date.Visible = true;
                
            }
            else
            {
                // Validate inputs
                if (string.IsNullOrWhiteSpace(CC_Number_coachs.Text) ||
                    string.IsNullOrWhiteSpace(Name_coachs.Text) ||
                    string.IsNullOrWhiteSpace(Age_Coachs.Text) ||
                    string.IsNullOrWhiteSpace(textBox1.Text) ||
                    !int.TryParse(Age_Coachs.Text, out _) ||
                    !int.TryParse(CC_Number_coachs.Text, out _) ||
                    !int.TryParse(textBox1.Text, out _))
                {
                    MessageBox.Show("Please ensure all fields are filled correctly and try again.");
                    return;
                }
                
                // Confirm Add Mode
                isAddMode = false;
                Add_Coach.Text = "Add";
                
                // Execute Add Logic
                comandoConfirmar = "adicionar";
                ExecuteAddOrUpdateCoach();
                LoadTypesIntoComboBox();
                // Hide the date pickers and contract ID field
                Initial_time_date_picker1.Visible = false;
                final_date_picker_2.Visible = false;
                Initial_date.Visible = false;
                final_date.Visible = false;

                // Clear the form
                clear("coaches", "limpar");
            }
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Search_C_Click(object sender, EventArgs e)
        {
            FiltrarCoachs();
            
        }
        
        private void Clean_C_Click(object sender, EventArgs e)
        {
            updateListaCoaches();
            clear("coaches", "limpar");
        }
        

        private void team_drop_coach_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarCoachs();
        }

        private void FiltrarCoachs()
        {
            string role = Role_Coach.Text;
            string team = team_drop_coach.Text;
            string realName = Search_coachs.Text;

            string query = "SELECT * FROM LOL.FilterCoachs WHERE 1=1";

            if (!string.IsNullOrEmpty(role))
            {
                query += " AND Role = @Role";
            }

            if (!string.IsNullOrEmpty(team))
            {
                query += " AND TeamName = @Team";
            }

            if (!string.IsNullOrEmpty(realName))
            {
                query += " AND RealName LIKE @RealName";
            }

            SqlCommand cmd = new SqlCommand(query, cn);

            if (!string.IsNullOrEmpty(role))
            {
                cmd.Parameters.AddWithValue("@Role", role);
            }
            if (!string.IsNullOrEmpty(team))
            {
                cmd.Parameters.AddWithValue("@Team", team);
            }
            if (!string.IsNullOrEmpty(realName))
            {
                cmd.Parameters.AddWithValue("@RealName", "%" + realName + "%");
            }

            SqlDataReader reader = cmd.ExecuteReader();
            Coachs_List.Items.Clear();
            int totalItems = 0;
            while (reader.Read())
            {
                string realNameResult = reader["RealName"]?.ToString() ?? string.Empty;
                totalItems++;
                Coachs_List.Items.Add(realNameResult);  // Exibe o nome real na lista
            }
            label6.Text = "Total de treinadores: " + totalItems.ToString();
            reader.Close();
        }

/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teamsv
/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams
/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams
   /// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams     
        /// Teams  /// Teams  /// Teams/// Teams
   /// Teams/// Teams/// Teams/// Teams/// Teams/// Teams/// Teams     
        private void team_list_selected_index_changed(object sender, EventArgs e)
{
    if (Teams_List.SelectedItem is string selectedTeamName)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("LOL.GetTeamDetails", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TeamName", selectedTeamName);
            SqlDataReader reader = cmd.ExecuteReader();
            
            if (reader.Read())
            {
                textBox2.Text = reader["Name"].ToString();
                team_id_t.Text = reader["ID"].ToString();
                textBox3.Text = reader["Coach_CCNumber"].ToString();
                textBox4.Text = reader["CoachName"].ToString();
                pointst.Text = reader["Points"].ToString();
                positiont.Text = reader["Position"].ToString();
                textBox5.Text = reader["Win_Rate"].ToString();
                numberofgamest.Text = reader["Number_Games"].ToString();
                sponsorst.Text = reader["Sponsors"].ToString();
                totalearningst.Text = reader["Total_Earnings"].ToString();
                Regiont.Text = reader["Region"].ToString();
                League_ID_T.Text = reader["League_ID"].ToString();
            }
            reader.NextResult();
            
            team_gamest.Clear();
            while (reader.Read())
            {
                string gameDetails = $"Game ID: {reader["GameID"]}{Environment.NewLine}Game Name: {reader["GameName"]}{Environment.NewLine}Date: {reader["GameDate"]}{Environment.NewLine}Winner: {reader["GameWinner"]}{Environment.NewLine}";
                team_gamest.AppendText(gameDetails);
            }
            reader.NextResult();

            Average_S.Clear();
            if (reader.Read())
            {
                string averageStats = $"Assists: {reader["Assists"]}{Environment.NewLine}Baron: {reader["Baron"]}{Environment.NewLine}Drakes: {reader["Drakes"]}{Environment.NewLine}Gold: {reader["Gold"]}{Environment.NewLine}Kills: {reader["Kills"]}{Environment.NewLine}Deaths: {reader["Deaths"]}{Environment.NewLine}Towers: {reader["Towers"]}{Environment.NewLine}Inhibs: {reader["Inibs"]}";
                Average_S.Text = averageStats;
            }
            reader.Close();
            
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error while loading team details! {ex.Message}");
        }
    }
}
    
     private void search_team_click(object sender, EventArgs e)
        {
            Confirmar_addt.Visible = false;
            Cancel_addt.Visible = false;
            Coach_name_t.Visible = true;
            textBox4.Visible = true;
            Points_T.Visible = true;
            pointst.Visible = true;
            Position_t.Visible = true;
            positiont.Visible = true;
            Win_rate_T.Visible = true;
            textBox5.Visible = true;
            Number_of_games_T.Visible = true;
            numberofgamest.Visible = true;
            try
            {
                if (verifySGBDConnection())
                {
                    string searchText = Name_of_Team.Text.Trim();
                    Teams_List.Items.Clear();
                    SqlCommand cmd = new SqlCommand("LOL.OrderTeamsAlphabetically", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string teamName = reader["Name"].ToString();
                        if (teamName.Contains(searchText, StringComparison.OrdinalIgnoreCase))
                        {
                            Teams_List.Items.Add(teamName);
                        }
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error while searching for teams! {ex.Message}");
            }
        }
        private void clean_team_click(object sender, EventArgs e)
        {
            updateListaTeams();
            Confirmar_addt.Visible = false;
            Cancel_addt.Visible = false;
            Coach_name_t.Visible = true;
            textBox4.Visible = true;
            Points_T.Visible = true;
            pointst.Visible = true;
            Position_t.Visible = true;
            positiont.Visible = true;
            Win_rate_T.Visible = true;
            textBox5.Visible = true;
            Number_of_games_T.Visible = true;
            numberofgamest.Visible = true;
            clear("teams", "limpar");
        }
        private void add_team_click(object sender, EventArgs e)
        {
            Coach_name_t.Visible = false;
            textBox4.Visible = false;
            Points_T.Visible = false;
            pointst.Visible = false;
            Position_t.Visible = false;
            positiont.Visible = false;
            Win_rate_T.Visible = false;
            textBox5.Visible = false;
            Number_of_games_T.Visible = false;
            numberofgamest.Visible = false;

            if (!isAddMode)
            {
                // Set to Add Mode
                isAddMode = true;
                Confirmar_addt.Text = "Confirm Add";
                Confirmar_addt.Visible = true;
                Cancel_addt.Visible = true;
            }
        }
        private void buttonCancel_Click(object sender, EventArgs e)
        {
            // Hide the confirm and cancel buttons
            Confirmar_addt.Visible = false;
            Cancel_addt.Visible = false;
            Coach_name_t.Visible = true;
            textBox4.Visible = true;
            Points_T.Visible = true;
            pointst.Visible = true;
            Position_t.Visible = true;
            positiont.Visible = true;
            Win_rate_T.Visible = true;
            textBox5.Visible = true;
            Number_of_games_T.Visible = true;
            numberofgamest.Visible = true;


            // Clear the form
            clear("teams", "limpar");

            isAddMode = false;
        }
        private void ExecuteAddOrUpdateTeam(string command)
{
    try
    {
        if (verifySGBDConnection())
        {
            int teamId = int.Parse(team_id_t.Text);
            string name = textBox2.Text;
            string region = Regiont.Text;
            float totalEarnings;
            if (!float.TryParse(totalearningst.Text, out totalEarnings) || totalEarnings <= 0)
            {
                MessageBox.Show("Please enter a valid Total Earnings value greater than 0.");
                return;
            }
            string sponsors = sponsorst.Text;
            int? coachCCNumber = string.IsNullOrWhiteSpace(textBox3.Text) ? (int?)null : int.Parse(textBox3.Text);
            int leagueId = int.Parse(League_ID_T.Text);

            SqlCommand cmd = new SqlCommand("LOL.AddOrUpdateTeam", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ID", teamId));
            cmd.Parameters.Add(new SqlParameter("@Name", name));
            cmd.Parameters.Add(new SqlParameter("@Region", region));
            cmd.Parameters.Add(new SqlParameter("@TotalEarnings", totalEarnings));
            cmd.Parameters.Add(new SqlParameter("@Sponsors", sponsors));
            cmd.Parameters.Add(new SqlParameter("@Coach_CCNumber", (object)coachCCNumber ?? DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@LeagueID", leagueId));
            cmd.Parameters.Add(new SqlParameter("@Command", command));
            cmd.ExecuteNonQuery();

            MessageBox.Show($"Team {command} successfully!");

            // Clear the form
            clear("teams", "limpar");
            updateListaTeams();
        }
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Error while {command} team! {ex.Message}");
    }
}
        private void ExecuteAddOrUpdateTeamStandings(string command)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    int teamID = int.Parse(textBox3.Text);  // Assuming you have a textbox for Team ID
                    int points = int.Parse(pointst.Text);
                    int position = int.Parse(positiont.Text);
                    float winRate = float.Parse(textBox5.Text);
                    int numberOfGames = int.Parse(numberofgamest.Text);
                    int leagueID = 1;  // Assuming a default League ID or get it from a form field

                    SqlCommand cmd = new SqlCommand("LOL.AddOrUpdateTeamStandings", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@TeamID", teamID));
                    cmd.Parameters.Add(new SqlParameter("@Points", points));
                    cmd.Parameters.Add(new SqlParameter("@Position", position));
                    cmd.Parameters.Add(new SqlParameter("@WinRate", winRate));
                    cmd.Parameters.Add(new SqlParameter("@NumberOfGames", numberOfGames));
                    cmd.Parameters.Add(new SqlParameter("@LeagueID", leagueID));
                    cmd.Parameters.Add(new SqlParameter("@Command", command));
                    cmd.ExecuteNonQuery();

                    MessageBox.Show($"Team standings {command} successfully!");

                    // Clear the form
                    clear("teams", "limpar");
                    LoadTeamNamesIntoComboBox();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error while {command} team standings! {ex.Message}");
            }
        }
        private void FilterLeagueT_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterTeamByLeague();
        }
private void FilterTeamByLeague()
{
    try
    {
        if (verifySGBDConnection())
        {
            if (FilterLeagueT.SelectedItem == null)
            {
                MessageBox.Show("Please select a league.");
                return;
            }

            string selectedLeagueName = FilterLeagueT.SelectedItem.ToString();
            
            Teams_List.Items.Clear();
            SqlCommand cmd = new SqlCommand("LOL.GetTeamsByLeagueName", cn); // Ensure this stored procedure exists
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LeagueName", selectedLeagueName);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string teamName = reader["Name"].ToString();
                Teams_List.Items.Add(teamName);
            }
            reader.Close();
        }
        else
        {
            MessageBox.Show("Database connection is not verified.");
        }
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Error while filtering teams! {ex.Message}");
    }
}
        private void Order_t_Click(object sender, EventArgs e)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    Teams_List.Items.Clear();
                    SqlCommand cmd = new SqlCommand("LOL.OrderTeamsByPoints", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string teamName = reader["Name"].ToString();
                        Teams_List.Items.Add($"{teamName} - Points: {reader["Points"]}");
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error while ordering teams! {ex.Message}");
            }
        }
    private void updateListaTeams()
        {
            totalItems = 0;

            Teams_List.Items.Clear();
            SqlCommand cmd = new SqlCommand("SELECT [Name] FROM LOL.Team", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string teamName = reader["Name"]?.ToString() ?? string.Empty;
                totalItems++;
                Teams_List.Items.Add(teamName);  // Display the team name in the list
            }
            label7.Text = "Total de equipes: " + totalItems.ToString();
            reader.Close();

            this.Teams_List.SelectedIndexChanged += new System.EventHandler(this.team_list_selected_index_changed);
        }
        private void Confirmar_addt_Click(object sender, EventArgs e)
        {
            if (isAddMode)
            {
                // Validate inputs
                if (string.IsNullOrWhiteSpace(textBox2.Text) ||
                    string.IsNullOrWhiteSpace(team_id_t.Text) ||
                    string.IsNullOrWhiteSpace(sponsorst.Text) ||
                    string.IsNullOrWhiteSpace(totalearningst.Text) ||
                    string.IsNullOrWhiteSpace(Regiont.Text) ||
                    string.IsNullOrWhiteSpace(League_ID_T.Text) ||
                    !float.TryParse(totalearningst.Text, out _))
                {
                    MessageBox.Show("Please ensure all fields are filled correctly and try again.");
                    return;
                }

                // Execute Add Logic
                comandoConfirmar = "adicionar";
                ExecuteAddOrUpdateTeam(comandoConfirmar);

                // Hide the confirm and cancel buttons
                Confirmar_addt.Visible = false;
                Cancel_addt.Visible = false;
                Coach_name_t.Visible = true;
                textBox4.Visible = true;
                Points_T.Visible = true;
                pointst.Visible = true;
                Position_t.Visible = true;
                positiont.Visible = true;
                Win_rate_T.Visible = true;
                textBox5.Visible = true;
                Number_of_games_T.Visible = true;
                numberofgamest.Visible = true;
                LoadTeamNamesIntoComboBox();
                // Clear the form
                clear("teams", "limpar");

                isAddMode = false;
            }
        }
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////STORE////////////////////////////////////////////////
    /////////////////////////////////////////////////////////STORE///////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////STORE////////////////////////////////////////////////
  /////////////////////////////////////////////////////////STORE///////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////                
        private void updateListaProducts()
        {
            try
            {
                if (verifySGBDConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.Product", cn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Pruducts_list.Items.Clear();
                    int totalProducts = 0;

                    while (reader.Read())
                    {
                        Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                        totalProducts++;
                    }
                    reader.Close();
                    Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error updating product list: {ex.Message}");
            }
        }
        private void Add_S_Click(object sender, EventArgs e)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    int productID = int.Parse(productids.Text); // Product ID
                    string name = ProductS.Text;
                    float price = float.Parse(priceS.Text);
                    string sizes = SizesS.Text;
                    string types = typel.Text; // Get the Types value from the typel TextBox
                    int storeID = int.Parse(StoreID.Text);
                    int stock = int.Parse(Stocks.Text);

                    SqlCommand cmd = new SqlCommand("LOL.AddOrUpdateProduct", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Product_ID", productID);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Sizes", sizes);
                    cmd.Parameters.AddWithValue("@Types", types);
                    cmd.Parameters.AddWithValue("@Store_ID", storeID);
                    cmd.Parameters.AddWithValue("@Stock", stock);
                    cmd.Parameters.AddWithValue("@Command", "adicionar");
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Product added successfully!");
                    updateListaProducts();
                    LoadTypesIntoComboBox();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error adding product: {ex.Message}");
            }
        }
        private void Teams_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterStore();  
        }

        private void Delete_S_Click(object sender, EventArgs e)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    int productId = int.Parse(productids.Text); // Use productids for product ID

                    SqlCommand cmd = new SqlCommand("LOL.DeleteProduct", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Product_ID", productId); // Correct parameter name
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Product deleted successfully!");
                    clear("store", "limpar");
                    updateListaProducts();
                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error deleting product: {ex.Message}");
            }
        }

        private void Search_S_Click(object sender, EventArgs e)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    string searchProduct = ProductS.Text;

                    SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.Product WHERE Name LIKE @Name", cn);
                    cmd.Parameters.AddWithValue("@Name", "%" + searchProduct + "%");
                    SqlDataReader reader = cmd.ExecuteReader();
                    Pruducts_list.Items.Clear();
                    int totalProducts = 0;

                    while (reader.Read())
                    {
                        Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                        totalProducts++;
                    }
                    reader.Close();
                    Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error searching product: {ex.Message}");
            }
        }
        private void Order_by_price_S_Click(object sender, EventArgs e)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    string selectedTeam = Teams.SelectedItem?.ToString();
                    string selectedType = Types.SelectedItem?.ToString();
                    
                    SqlCommand cmd = new SqlCommand("LOL.OrderProductsByPrice", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeamName", string.IsNullOrEmpty(selectedTeam) ? (object)DBNull.Value : selectedTeam);
                    cmd.Parameters.AddWithValue("@Type", string.IsNullOrEmpty(selectedType) ? (object)DBNull.Value : selectedType);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Pruducts_list.Items.Clear();
                    int totalProducts = 0;

                    while (reader.Read())
                    {
                        Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                        totalProducts++;
                    }
                    reader.Close();
                    Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error ordering by price: {ex.Message}");
            }
        }

       private void Order_by_Sizes_S_Click(object sender, EventArgs e)
    {
        try
        {
            if (verifySGBDConnection())
            {
                string selectedTeam = Teams.SelectedItem?.ToString();
                string selectedType = Types.SelectedItem?.ToString();
                
                SqlCommand cmd = new SqlCommand("LOL.OrderProductsBySizes", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TeamName", string.IsNullOrEmpty(selectedTeam) ? (object)DBNull.Value : selectedTeam);
                cmd.Parameters.AddWithValue("@Type", string.IsNullOrEmpty(selectedType) ? (object)DBNull.Value : selectedType);
                SqlDataReader reader = cmd.ExecuteReader();
                Pruducts_list.Items.Clear();
                int totalProducts = 0;

                while (reader.Read())
                {
                    Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                    totalProducts++;
                }
                reader.Close();
                Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error ordering by sizes: {ex.Message}");
        }
    }
        private void Stores_SelectedIndexChanged(object sender, EventArgs e)
        {
              
        }
        private void FilterStoreByTeam()
        {
            try
            {
                if (verifySGBDConnection())
                {
                    string selectedTeam = Teams.SelectedItem?.ToString();
                    string selectedType = Types.SelectedItem?.ToString();

                    SqlCommand cmd = new SqlCommand("LOL.FilterProductsByTeam", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeamName", string.IsNullOrEmpty(selectedTeam) ? (object)DBNull.Value : selectedTeam);
                    cmd.Parameters.AddWithValue("@Type", string.IsNullOrEmpty(selectedType) ? (object)DBNull.Value : selectedType);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Pruducts_list.Items.Clear();
                    int totalProducts = 0;

                    while (reader.Read())
                    {
                        Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                        totalProducts++;
                    }
                    reader.Close();
                    Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error filtering products by team: {ex.Message}");
            }
        }
        private void Types_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterStore();
        }
        private void FilterStore()
{
    try
    {
        if (verifySGBDConnection())
        {
            string selectedTeam = Teams.SelectedItem?.ToString();
            string selectedType = Types.SelectedItem?.ToString();

            SqlCommand cmd = new SqlCommand("LOL.FilterProductsByTeam", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TeamName", string.IsNullOrEmpty(selectedTeam) ? (object)DBNull.Value : selectedTeam);
            cmd.Parameters.AddWithValue("@Type", string.IsNullOrEmpty(selectedType) ? (object)DBNull.Value : selectedType);

            SqlDataReader reader = cmd.ExecuteReader();
            Pruducts_list.Items.Clear();
            int totalProducts = 0;

            while (reader.Read())
            {
                Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                totalProducts++;
            }
            reader.Close();
            Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
        }
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Error filtering products: {ex.Message}");
    }
}        private void Order_by_Stocks_Click(object sender, EventArgs e)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    string selectedTeam = Teams.SelectedItem?.ToString();
                    string selectedType = Types.SelectedItem?.ToString();
                    
                    SqlCommand cmd = new SqlCommand("LOL.OrderProductsByStock", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeamName", string.IsNullOrEmpty(selectedTeam) ? (object)DBNull.Value : selectedTeam);
                    cmd.Parameters.AddWithValue("@Type", string.IsNullOrEmpty(selectedType) ? (object)DBNull.Value : selectedType);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Pruducts_list.Items.Clear();
                    int totalProducts = 0;

                    while (reader.Read())
                    {
                        Pruducts_list.Items.Add($"{reader["Name"]} (ID: {reader["ID"]}, Price: {reader["Price"]}, Size: {reader["Sizes"]}, Stock: {reader["Stock"]})");
                        totalProducts++;
                    }
                    reader.Close();
                    Total_of_Products_S.Text = $"Total of Product: {totalProducts}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error ordering by stock: {ex.Message}");
            }
        }

        private void Clean_S_Click(object sender, EventArgs e)
        {
            
            clear("store", "limpar");
            updateListaProducts();
        }

        private void Products_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Pruducts_list.SelectedItem is string selectedProduct)
            {
                try
                {
                    if (verifySGBDConnection())
                    {
                        // Extract the ID from the selected product string
                        var parts = selectedProduct.Split(new[] { " (ID: ", ", Price: ", ", Size: ", ", Stock: ", ")" }, StringSplitOptions.RemoveEmptyEntries);
                        if (parts.Length >= 5)
                        {
                            int id = int.Parse(parts[1]);  // Use the correct index to get the ID

                            SqlCommand cmd = new SqlCommand("SELECT * FROM LOL.ProductDetails WHERE ID = @ID", cn);
                            cmd.Parameters.AddWithValue("@ID", id);
                            SqlDataReader reader = cmd.ExecuteReader();

                            if (reader.Read())
                            {
                                StoreID.Text = reader["Store_ID"].ToString();
                                productids.Text = reader["ID"].ToString();
                                ProductS.Text = reader["Name"].ToString();
                                priceS.Text = reader["Price"].ToString();
                                SizesS.Text = reader["Sizes"].ToString();
                                typel.Text = reader["Types"].ToString();
                                Stocks.Text = reader["Stock"].ToString();
                                textBox6.Text = reader["Owner_CCNumber"].ToString();
                                Stores.Text = reader["StoreName"].ToString();
                            }
                            reader.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error loading product details: {ex.Message}");
                }
            }
        }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///
            /////LEAGUE/LEAGUE/LEAGUE/LEAGUE/LEAGUE/LEAGUEE/LEAGUE/LEAGUE/LEAGUE/LEAGUEE/LEAGUE/LEAGUE/LEAGUE/LEAGUE




    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    private void updateLiga()
    {
        try
        {
            if (verifySGBDConnection())
            {
                Leagues.Items.Clear();
                SqlCommand cmd = new SqlCommand("SELECT [Name] FROM LOL.League", cn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Leagues.Items.Add(reader["Name"].ToString());
                }
                reader.Close();
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error while updating leagues! {ex.Message}");
        }
    }

    private void Leagues_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Leagues.SelectedItem is string selectedLeague)
        {
            // Set the LeagueNameL textbox with the selected league
            LeagueNameL.Text = selectedLeague;

            // Fetch the league ID based on the selected league name
            try
            {
                if (verifySGBDConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT ID FROM LOL.League WHERE Name = @LeagueName", cn);
                    cmd.Parameters.AddWithValue("@LeagueName", selectedLeague);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        League_ID_L.Text = reader["ID"].ToString();
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error while fetching league ID! {ex.Message}");
            }

            // Semi-clear before updating teams in the selected league
            clear("league", "semiclear");
            updateTeams(selectedLeague);
        }
    }

    private void Team_L_SelectedIndexChanged(object sender, EventArgs e)
{
    if (Team_L.SelectedItem is string selectedTeam)
    {
        // Semi-clear before updating games for the selected team
        clear("team", "semiclear");

        try
        {
            if (verifySGBDConnection())
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT 
                        t.ID, t.Name, t.Region, t.Total_Earnings, t.Sponsors, c.CCNumber AS Coach_CCNumber, p.Name AS CoachName,
                        s.Points, s.Position, s.Win_Rate, s.Number_Games
                    FROM 
                        LOL.Team t
                    LEFT JOIN 
                        LOL.Coachs c ON t.Coach_CCNumber = c.CCNumber
                    LEFT JOIN 
                        LOL.Person p ON c.CCNumber = p.CCNumber
                    LEFT JOIN 
                        LOL.Standings s ON t.ID = s.Team_ID
                    WHERE 
                        t.Name = @TeamName", cn);
                cmd.Parameters.AddWithValue("@TeamName", selectedTeam);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    team_id_t.Text = reader["ID"].ToString();
                    textBox2.Text = reader["Name"].ToString();
                    textBox4.Text = reader["CoachName"].ToString();
                    textBox3.Text = reader["Coach_CCNumber"].ToString();
                    sponsorst.Text = reader["Sponsors"].ToString();
                    totalearningst.Text = reader["Total_Earnings"].ToString();
                    Regiont.Text = reader["Region"].ToString();

                    // Update league-specific details for the selected team
                    PointsL.Text = reader["Points"]?.ToString() ?? "";
                    PositionL.Text = reader["Position"]?.ToString() ?? "";
                    Win_rateL.Text = reader["Win_Rate"]?.ToString() ?? "";
                    Number_of_games_L.Text = reader["Number_Games"]?.ToString() ?? "";

                    // Load games for the selected team
                    int teamID = int.Parse(reader["ID"].ToString());
                    reader.Close(); // Close the reader before opening another
                    updateGames(teamID);
                }
                else
                {
                    reader.Close();
                }
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error while loading team details! {ex.Message}");
        }
    }
}

    private void updateGames(int teamID)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    GamesL.Items.Clear();
                    SqlCommand cmd = new SqlCommand("LOL.GetTeamGames", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeamID", teamID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string teamName1 = reader["TeamName1"].ToString();
                        string teamName2 = reader["TeamName2"].ToString();
                        string gameID = reader["GameID"].ToString();
                        GamesL.Items.Add($"{teamName1} vs {teamName2} (ID: {gameID})");
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error while loading games! {ex.Message}");
            }
        }
    private void GamesL_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GamesL.SelectedItem is string selectedGame)
        {
            try
            {
                if (verifySGBDConnection())
                {
                    int gameID = int.Parse(selectedGame.Split(" (ID: ")[1].Replace(")", ""));
                    SqlCommand cmd = new SqlCommand("LOL.GetGameDetails", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@GameID", gameID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        gameid.Text = reader["GameID"].ToString();
                        TimeL.Text = reader["GameDate"].ToString();
                        Winner_Of_Game_L.Text = reader["GameWinner"].ToString();
                    }

                    reader.NextResult(); // Move to the second result set

                    var individualStats = new List<string>();
                    while (reader.Read())
                    {
                        individualStats.Add($"{reader["PlayerName"]}: {reader["Kills"]} Kills, {reader["Assists"]} Assists, {reader["Deaths"]} Deaths");
                    }
                    Individual_StatistricsL.Text = string.Join(Environment.NewLine, individualStats);

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error while loading game details! {ex.Message}");
            }
        }
    }
    private void OrderbywinrateL_Click(object sender, EventArgs e)
{
    if (int.TryParse(League_ID_L.Text, out int leagueID))
    {
        try
        {
            if (verifySGBDConnection())
            {
                SqlCommand cmd = new SqlCommand("LOL.OrderTeamsByWinRate", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LeagueID", leagueID);
                SqlDataReader reader = cmd.ExecuteReader();
                Team_L.Items.Clear();

                // Clear Games and Individual Statistics lists
                GamesL.Items.Clear();
                Individual_StatistricsL.Clear();

                while (reader.Read())
                {
                    string teamDetails = $"Win Rate: {reader["Win_Rate"]}, Team: {reader["TeamName"]}, Points: {reader["Points"]}, Position: {reader["Position"]}, Games: {reader["Number_Games"]}";
                    Team_L.Items.Add(teamDetails);
                }
                reader.Close();
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error while ordering teams by win rate: {ex.Message}");
        }
    }
    else
    {
        MessageBox.Show("Please enter a valid league ID.");
    }
}

       private void Orderbypositionl_Click(object sender, EventArgs e)
{
    if (int.TryParse(League_ID_L.Text, out int leagueID))
    {
        try
        {
            if (verifySGBDConnection())
            {
                SqlCommand cmd = new SqlCommand("LOL.OrderTeamsByPosition", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LeagueID", leagueID);
                SqlDataReader reader = cmd.ExecuteReader();
                Team_L.Items.Clear();

                // Clear Games and Individual Statistics lists
                GamesL.Items.Clear();
                Individual_StatistricsL.Clear();

                while (reader.Read())
                {
                    string teamDetails = $"Position: {reader["Position"]}, Team: {reader["TeamName"]}, Points: {reader["Points"]}, Win Rate: {reader["Win_Rate"]}, Games: {reader["Number_Games"]}";
                    Team_L.Items.Add(teamDetails);
                }
                reader.Close();
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error while ordering teams by position: {ex.Message}");
        }
    }
    else
    {
        MessageBox.Show("Please enter a valid league ID.");
    }
}

        private void Delete_League_L_Click(object sender, EventArgs e)
        {
            if (int.TryParse(League_ID_L.Text, out int leagueID))
            {
                try
                {
                    if (verifySGBDConnection())
                    {
                        SqlCommand cmd = new SqlCommand("LOL.DeleteLeague", cn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", leagueID);
                        cmd.ExecuteNonQuery();

                        MessageBox.Show("League deleted successfully!");
                        updateLiga();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error while deleting league! {ex.Message}");
                }
            }
            else
            {
                MessageBox.Show("Please enter a valid league ID.");
            }
        }
        private void updateTeams(string selectedLeague)
{
    try
    {
        if (verifySGBDConnection())
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT t.Name AS TeamName
                FROM LOL.Team t
                INNER JOIN LOL.League l ON t.League_ID = l.ID
                WHERE l.Name = @LeagueName", cn);
            cmd.Parameters.AddWithValue("@LeagueName", selectedLeague);
            SqlDataReader reader = cmd.ExecuteReader();

            Team_L.Items.Clear();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    if (reader["TeamName"] != DBNull.Value)
                    {
                        Team_L.Items.Add(reader["TeamName"].ToString());
                    }
                }
            }
            else
            {
                // Clear league details if no teams found
                PointsL.Text = "";
                PositionL.Text = "";
                Win_rateL.Text = "";
                Number_of_games_L.Text = "";
            }
            reader.Close();
        }
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Error while loading league details! {ex.Message}");
    }
}
        private void Add_LeagueL_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(LeagueNameL.Text))
            {
                try
                {
                    if (verifySGBDConnection())
                    {
                        SqlCommand cmd = new SqlCommand("LOL.AddOrUpdateLeague", cn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Name", LeagueNameL.Text);

                        // Ensure ID is provided correctly
                        if (string.IsNullOrEmpty(League_ID_L.Text))
                        {
                            MessageBox.Show("Please provide a League ID.");
                            return;
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@ID", int.Parse(League_ID_L.Text));
                        }

                        cmd.ExecuteNonQuery();

                        MessageBox.Show("League added/updated successfully!");
                        updateLiga();
                        clear("league", "limpar");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error while adding/updating league! {ex.Message}");
                }
            }
            else
            {
                MessageBox.Show("Please enter a league name.");
            }
        }
        private void Cleanleague_Click(object sender, EventArgs e)
        {
            updateLiga();
            clear("league", "limpar");
        }
        

}
}

    