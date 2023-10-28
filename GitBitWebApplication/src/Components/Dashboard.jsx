import React, {useEffect, useState} from "react";
import {
  Box,
  Button,
  Typography,
  ThemeProvider,
  CssBaseline,
} from "@mui/material";
import { createTheme, responsiveFontSizes } from "@mui/material/styles";
import { tokens } from "../theme";
import DownloadOutlinedIcon from "@mui/icons-material/DownloadOutlined";
import EmailIcon from "@mui/icons-material/Email";
import PointOfSaleIcon from "@mui/icons-material/PointOfSale";
import PersonAddIcon from "@mui/icons-material/PersonAdd";
import TrafficIcon from "@mui/icons-material/Traffic";
import { StaticNavBar } from "./Navbar";
import Header from "./Header";
import axios from "axios";

const Dashboard = () => {
  const [name, setName] = useState('ShashwatPS');
  const [fork,setForks] = useState('');
  const [stars,setStars] = useState('');
  const [followers,setFollowers] = useState('');
  const [following,setFollowing] = useState('');

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

  const darkTheme = responsiveFontSizes(
      createTheme({
        palette: {
          mode: "dark",
        },
      })
  );



  const colors = tokens(darkTheme.palette.mode);

  return (
      <div>
        <StaticNavBar />
        <ThemeProvider theme={darkTheme}>
          <CssBaseline />
          <Box m="20px">
            <Box
                display="flex"
                justifyContent="space-between"
                alignItems="center"
            >
              <Box>
                  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=ShashwatPS&theme=tokyonight&layout=compact&langs_count=8" alt="Top Languages Card" />
                  <Button
                    sx={{
                      backgroundColor: colors.blueAccent[700],
                      color: colors.grey[100],
                      fontSize: "14px",
                      fontWeight: "bold",
                      padding: "10px 20px",
                    }}
                >
                  User Access Token
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
              {Array.from({ length: 4 }).map((_, index) => (
                  <Box
                      key={index}
                      gridColumn={`span ${index % 2 === 0 ? 3 : 4}`}
                      backgroundColor={colors.primary[800]}
                      display="flex"
                      alignItems="center"
                      justifyContent="center"
                      padding="20px"
                      borderRadius="8px"
                  >
                    {index === 0 && "Data"}
                    {index === 1 && "Data 2"}
                    {index === 2 && "Data 3"}
                    {index === 3 && "Data 4"}
                  </Box>
              ))}

              {/* ROW 2 */}
              <Box
                  gridColumn="span 8"
                  gridRow="span 2"
                  backgroundColor={colors.primary[800]}
                  padding="20px"
                  borderRadius="8px"
              >
                This is Vibhor
                {/* Icon */}
              </Box>
              <Box
                  gridColumn="span 4"
                  gridRow="span 2"
                  backgroundColor={colors.primary[800]}
                  overflow="auto"
                  padding="20px"
                  borderRadius="8px"
              >
                Forks
              </Box>

              {/* ROW 3 */}
              {/* Continue modifying the styles for the rest of the boxes */}
              {/* ... */}
            </Box>
          </Box>
        </ThemeProvider>
      </div>
  );
};

export default Dashboard;
