import { Box, Button, IconButton, Typography, useTheme } from "@mui/material";
import { tokens } from "../theme";
import {useNavigate} from "react-router-dom"
// import { mockTransactions } from "../../data/mockData";
import DownloadOutlinedIcon from "@mui/icons-material/DownloadOutlined";
import EmailIcon from "@mui/icons-material/Email";
import PointOfSaleIcon from "@mui/icons-material/PointOfSale";
import PersonAddIcon from "@mui/icons-material/PersonAdd";
import TrafficIcon from "@mui/icons-material/Traffic";
import Header from "./Header";
import { CssBaseline, ThemeProvider } from "@mui/material";
import { ColorModeContext, useMode } from "../theme";
import { useState , useEffect } from "react";
import axios from "axios";
import ForkLeftIcon from '@mui/icons-material/ForkLeft';
import StarIcon from '@mui/icons-material/Star';
import PeopleIcon from '@mui/icons-material/People';
// import Header from "../../components/Header";
// import LineChart from "../../components/LineChart";
// import GeographyChart from "../../components/GeographyChart";
// import BarChart from "../../components/BarChart";
// import StatBox from "../../components/StatBox";
// import ProgressCircle from "../../components/ProgressCircle";

import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';
import { FixedSizeList } from 'react-window';

const Dashboard = () => {
  const [theme, colorMode] = useMode();
  const colors = tokens(theme.palette.mode);
  const [name, setName] = useState('ShashwatPS');
  const [fork,setForks] = useState('');
  const [stars,setStars] = useState('');
  const [followers,setFollowers] = useState('');
  const [following,setFollowing] = useState('');
  const navigate = useNavigate();
  function renderRow(props) {
    const { index, style } = props;
  
    return (
      <ListItem style={style} key={index} component="div" disablePadding>
        <ListItemButton>
          <ListItemText primary={`Item ${index + 1}`} />
        </ListItemButton>
      </ListItem>
    );
  }


  useEffect(() => {
    const fetchData = async () => {
        try {
            const response = await axios.post('http://localhost:5006/data', {}, { name });
            if (response.data.success) {
                console.log(response.data);
                setForks(response.data.forks);
                setStars(response.data.stars);
                const githubResponse = await axios.get(`https://api.github.com/users/${name}`);
                console.log(githubResponse.data.followers)
                setFollowers(githubResponse.data.followers);
                console.log(githubResponse.data.following)
                setFollowing(githubResponse.data.following);
            } else {
                console.error('Error:', response.data.message);
            }
        } catch (error) {
            console.error('Error:', error.message);
        }
    };
    fetchData();
}, []);

  return (
    <ColorModeContext.Provider value={colorMode}>
      <ThemeProvider theme={theme}>
      <CssBaseline />
    <Box m="20px">
      {/* HEADER */}
      <Box display="flex" justifyContent="space-between" alignItems="center">
        <Header title="DASHBOARD" subtitle="@Litomatoma2703" />

        <Box>
          <Button
            sx={{
              backgroundColor: colors.blueAccent[700],
              color: colors.grey[100],
              fontSize: "14px",
              fontWeight: "bold",
              padding: "10px 20px",
            }}
          onClick={()=>navigate("/tools")}>
            {/* <DownloadOutlinedIcon sx={{ mr: "10px" }} /> */}
            View Tools
          </Button>
        </Box>
      </Box>

      {/* GRID & CHARTS */}
      <Box
        display="grid"
        gridTemplateColumns="repeat(12, 1fr)"
        gridAutoRows="140px"
        gap="20px"
      >
        {/* ROW 1 */}
        <Box
          gridColumn="span 3"
          backgroundColor={colors.primary[400]}
          display="flex"
          alignItems="center"
          justifyContent="center"
        >
          {/* <StatBox
            title="23"
            subtitle="Total Forks"
            progress="0.75"
            increase="+14%"
            icon={
              <ForkLeftIcon
                sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
              />
            }
          /> */}
          <Typography style={{marginLeft : "-10vh" , marginTop : "-13vh"}}>Total Forks</Typography>
          <h1 style={{marginLeft : "5vh" , color : "Black" , fontSize : "7vh"}}>23</h1>
          <div style={{}}>
            <h1><ForkLeftIcon style={{fontSize : "6vh"  , position : "relative" , left : "10vh" , top : "-3vh"}}></ForkLeftIcon></h1>
          </div>
        </Box>
        <Box
          gridColumn="span 3"
          backgroundColor={colors.primary[400]}
          display="flex"
          alignItems="center"
          justifyContent="center"
        >
          {/* <StatBox
            title="431,225"
            subtitle="Sales Obtained"
            progress="0.50"
            increase="+21%"
            icon={
              <PointOfSaleIcon
                sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
              />
            }
          /> */}
          <Typography style={{marginLeft : "-10vh" , marginTop : "-13vh"}}> Total Stars</Typography>
          <h1 style={{marginLeft : "5vh" , color : "Black" , fontSize : "7vh"}}>23</h1>
          <div style={{}}>
            <h1><StarIcon style={{fontSize : "6vh"  , position : "relative" , left : "10vh" , top : "-3vh"}}></StarIcon></h1>
          </div>
        </Box>
        <Box
          gridColumn="span 3"
          backgroundColor={colors.primary[400]}
          display="flex"
          alignItems="center"
          justifyContent="center"
        >
          {/* <StatBox
            title="32,441"
            subtitle="New Clients"
            progress="0.30"
            increase="+5%"
            icon={
              <PersonAddIcon
                sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
              />
            }
          /> */}

          <Typography style={{marginLeft : "-10vh" , marginTop : "-13vh"}}> Total Followers</Typography>
          <h1 style={{marginLeft : "5vh" , color : "Black" , fontSize : "7vh"}}>23</h1>
          <div style={{}}>
            <h1><PeopleIcon style={{fontSize : "6vh"  , position : "relative" , left : "10vh" , top : "-3vh"}}></PeopleIcon></h1>
          </div>
        </Box>
        <Box
          gridColumn="span 3"
          backgroundColor={colors.primary[400]}
          display="flex"
          alignItems="center"
          justifyContent="center"
        >
          {/* <StatBox
            title="1,325,134"
            subtitle="Traffic Received"
            progress="0.80"
            increase="+43%"
            icon={
              <TrafficIcon
                sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
              />
            }
          /> */}

          <Typography style={{marginLeft : "-10vh" , marginTop : "-13vh"}}>Following</Typography>
          <h1 style={{marginLeft : "5vh" , color : "Black" , fontSize : "7vh"}}>23</h1>
          <div style={{}}>
            <h1><PeopleIcon style={{fontSize : "6vh"  , position : "relative" , left : "10vh" , top : "-3vh"}}></PeopleIcon></h1>
          </div>

        </Box>

        {/* ROW 2 */}
        <Box
          gridColumn="span 8"
          gridRow="span 2"
          backgroundColor={colors.primary[400]}
        >
          <Box
            mt="25px"
            p="0 30px"
            display="flex "
            justifyContent="space-between"
            alignItems="center"
          >
            {/* <Box>
              <Typography
                variant="h5"
                fontWeight="600"
                color={colors.grey[100]}
              >
                Revenue Generated
              </Typography>
              <Typography
                variant="h3"
                fontWeight="bold"
                color={colors.greenAccent[500]}
              >
                $59,342.32
              </Typography>
            </Box> */}
            
            <div style={{marginTop : "-6.5vh"}}>
            <h1 style={{paddingBottom : "0.5vh"}}>Top 15 repos</h1>
            <Box
        sx={{ marginTop : "-3.5vh" ,  width: '100%', height: 300, maxWidth: 1100 }}>
            <FixedSizeList
            height={250}
            width={930}
            itemSize={46}
            itemCount={200}
            overscanCount={5}
            >
            {renderRow}
            </FixedSizeList>
            </Box>
            </div>


            {/* <Box>
              <IconButton>
                <DownloadOutlinedIcon
                  sx={{ fontSize: "26px", color: colors.greenAccent[500] }}
                />
              </IconButton>
            </Box> */}
          </Box>
          <Box height="250px" m="-20px 0 0 0">
            {/* <LineChart isDashboard={true} /> */}
          </Box>
        </Box>
        <Box
          gridColumn="span 4"
          gridRow="span 2"
          backgroundColor={colors.primary[400]}
          overflow="auto"
        >
          {/* <Box
            display="flex"
            justifyContent="space-between"
            alignItems="center"
            borderBottom={`4px solid ${colors.primary[500]}`}
            colors={colors.grey[100]}
            p="15px"
          >
            <Typography color={colors.grey[100]} variant="h5" fontWeight="600">
              Recent Transactions
            </Typography>
          </Box>
          {mockTransactions.map((transaction, i) => (
            <Box
              key={`${transaction.txId}-${i}`}
              display="flex"
              justifyContent="space-between"
              alignItems="center"
              borderBottom={`4px solid ${colors.primary[500]}`}
              p="15px"
            >
              <Box>
                <Typography
                  color={colors.greenAccent[500]}
                  variant="h5"
                  fontWeight="600"
                >
                  {transaction.txId}
                </Typography>
                <Typography color={colors.grey[100]}>
                  {transaction.user}
                </Typography>
              </Box>
              side and data entries
              <Box color={colors.grey[100]}>{transaction.date}</Box>
              <Box
                backgroundColor={colors.greenAccent[500]}
                p="5px 10px"
                borderRadius="4px"
              >
                ${transaction.cost}
              </Box>
            </Box>
          ))}
          s */}

<div style={{marginTop : "-1.5vh"}}>
            <h1 style={{paddingBottom : "0.5vh"}}>Recent Forks</h1>
            <Box
        sx={{ marginTop : "-1.5vh" ,  width: '100%', height: 240, maxWidth: 480 }}>
            <FixedSizeList
            height={240}
            width={480}
            itemSize={46}
            itemCount={200}
            overscanCount={5}
            >
            {renderRow}
            </FixedSizeList>
            </Box>
            </div>
        </Box>

        {/* ROW 3 */}
        <Box
          gridColumn="span 4"
          gridRow="span 2"
          backgroundColor={colors.primary[400]}
          p="30px"
        >
          <Typography variant="h5" fontWeight="600">
            Your Languages
          </Typography>
          <Box
            display="flex"
            flexDirection="column"
            alignItems="center"
            mt="25px"
          >
            {/* <ProgressCircle size="125" /> */}
            <Typography
              variant="h5"
              color={colors.greenAccent[500]}
              sx={{  }}
            >
            <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=anuraghazra&layout=donut&theme=prussian" alt="Top Languages Card" />
            </Typography>
            {/* <Typography>Includes extra misc expenditures and costs</Typography> */}
          </Box>
        </Box>
        <Box
          gridColumn="span 4"
          gridRow="span 2"
          backgroundColor={colors.primary[400]}
        >
          <Typography
            variant="h5"
            fontWeight="600"
            sx={{ padding: "30px 30px 0 30px" }}
          >
            Data NXST
          </Typography>
          <Box height="250px" mt="-20px">
            {/* <BarChart isDashboard={true} /> */}
          </Box>
        </Box>
        <Box
          gridColumn="span 4"
          gridRow="span 2"
          backgroundColor={colors.primary[400]}
          padding="30px"
        >
          <Typography
            variant="h5"
            fontWeight="600"
            sx={{ marginBottom: "15px" }}
          >
            DATA 3
          </Typography>
          <Box height="200px">
            {/* <GeographyChart isDashboard={true} /> */}
          </Box>
        </Box>
      </Box>
    </Box>
    </ThemeProvider>
    </ColorModeContext.Provider>
  );
};

export default Dashboard;
