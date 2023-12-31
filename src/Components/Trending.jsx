import * as React from 'react';
import { styled, createTheme, ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';
import MuiDrawer from '@mui/material/Drawer';
import Box from '@mui/material/Box';
import MuiAppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import List from '@mui/material/List';
import Typography from '@mui/material/Typography';
import Divider from '@mui/material/Divider';
import IconButton from '@mui/material/IconButton';
import Link from '@mui/material/Link';
import MenuIcon from '@mui/icons-material/Menu';
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import SearchIcon from '@mui/icons-material/Search';
import InputBase from '@mui/material/InputBase';
import { useEffect, useState } from 'react';
import axios from 'axios';
import { Oval as Loader } from 'react-loader-spinner';
import {
    Button,
    Card,
    CardActionArea,
    CardContent,
    CardMedia,
    MenuItem,
    Select,
} from '@mui/material';
import StarIcon from '@mui/icons-material/Star';
import CallSplitIcon from '@mui/icons-material/CallSplit';
function Copyright(props) {
    return (
        <Typography variant="body2" color="text.secondary" align="center" {...props}>
            {'Copyright © '}
            <Link color="inherit" href="https://mui.com/">
                GitBit
            </Link>{' '}
            {new Date().getFullYear()}
            {'.'}
        </Typography>
    );
}

const drawerWidth = 240;

const AppBar = styled(MuiAppBar, {
    shouldForwardProp: (prop) => prop !== 'open',
})(({ theme, open }) => ({
    zIndex: theme.zIndex.drawer + 1,
    transition: theme.transitions.create(['width', 'margin'], {
        easing: theme.transitions.easing.sharp,
        duration: theme.transitions.duration.leavingScreen,
    }),
    ...(open && {
        marginLeft: 0, // Set marginLeft to 0 when the drawer is open
        width: `calc(100% - ${drawerWidth}px)`,
        transition: theme.transitions.create(['width', 'margin'], {
            easing: theme.transitions.easing.sharp,
            duration: theme.transitions.duration.enteringScreen,
        }),
    }),
    backgroundColor: 'rgba(4, 13, 18, 0.8)',
    backdropFilter: 'blur(8px)',
}));


const defaultTheme = createTheme({
    palette: {
        primary: {
            main: '#5C8374',
        },
        secondary: {
            main: '#93B1A6',
        },
        text: {
            primary: '#fff',
        },
    },
});

export default function Trending() {
    const [data, setData] = useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [sortBy, setSortBy] = useState(null);

    const handleSearchChange = (event) => {
        setSearchQuery(event.target.value);
    };

    const handleSearchClick = async () => {
        try {
            let response;

            if (searchQuery.trim() === '') {
                response = await axios.get('https://api.github.com/search/repositories?q=created:%3E2021-01-01&sort=stars&order=desc');
            }
            else {
                response = await axios.get(`https://api.github.com/search/repositories?q=${searchQuery}+is:featured&sort=${sortBy}&order=desc`);
            }
            const orgData = response.data;
            if (sortBy === 'stars') {
                orgData.items.sort((a, b) => b.stargazers_count - a.stargazers_count);
            }
            else if (sortBy === 'forks') {
                orgData.items.sort((a, b) => b.forks_count - a.forks_count);
            }
            setData(orgData);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    };

    const handleSortClick = (criteria) => {
        setSortBy(criteria);
    };

    useEffect(() => {
        handleSearchClick();
    }, [sortBy]);

    return (
        <ThemeProvider theme={defaultTheme}>
            <CssBaseline />
            <Box
                sx={{
                    display: 'flex',
                    overflow: 'hidden',
                    width: '100vw',
                    height: '100vh',
                }}
            >
                <AppBar>
                    <Toolbar
                        sx={{
                            pr: '24px',
                        }}
                    >
                        <Toolbar
                            sx={{
                                pr: '24px',
                            }}
                        >
                            <IconButton
                                edge="start"
                                color="inherit"
                                aria-label="open drawer"
                                sx={{
                                    marginRight: '36px',
                                    ...(open && { display: 'none' }),
                                }}
                            >
                                <MenuIcon />
                            </IconButton>
                            <Typography
                                component="h1"
                                variant="h6"
                                color="inherit"
                                noWrap
                                sx={{ flexGrow: 1 }}
                            >
                                TRENDING REPOS
                            </Typography>
                            <div className="search-container" sx={{ position: 'relative', marginLeft: 'auto', marginRight: '16px' }}>
                                <SearchIcon sx={{ position: 'absolute', top: '50%', transform: 'translateY(-50%)', marginLeft: '8px', color: '#93B1A6' }} />
                                <InputBase
                                    placeholder="Search..."
                                    value={searchQuery}
                                    onChange={handleSearchChange}
                                    sx={{
                                        color: 'white',
                                        paddingLeft: '32px',
                                    }}
                                />
                                <Button variant="contained" color="primary" onClick={handleSearchClick} sx={{ marginLeft: '8px' }}>
                                    Search
                                </Button>
                            </div>

                            <div sx={{ marginLeft: '16px' }}>
                                <Button
                                    variant="contained"
                                    color="primary"
                                    onClick={() => handleSortClick('stars')}
                                    sx={{ marginLeft: '8px' }}
                                >
                                    Sort by Stars
                                </Button>
                                <Button
                                    variant="contained"
                                    color="primary"
                                    onClick={() => handleSortClick('forks')}
                                    sx={{ marginLeft: '8px' }}
                                >
                                    Sort by Forks
                                </Button>
                            </div>
                        </Toolbar>
                    </Toolbar>
                </AppBar>
                <Box
                    component="main"
                    sx={{
                        flexGrow: 1,
                        overflow: 'auto',
                        background: 'linear-gradient(to right, #7FB3B3, #183D3D)',
                        padding: '30px',
                        display: 'flex',
                        flexWrap: 'wrap',
                        justifyContent: 'center',
                        alignItems: 'center',
                        minHeight: '100vh',
                        paddingTop: '50px',
                    }}
                >
                    {data && data.items && data.items.length > 0 ? (
                        data.items.map((repository) => (
                            <Org key={repository.id} repo={repository} />
                        ))
                    ) : (
                        data && data.items && data.items.length === 0 ? null : (
                            <Loader color="#183D3D" height={50} width={50} />
                        )
                    )}
                </Box>
            </Box>
        </ThemeProvider>
    );
}


function Org(props) {
    const languageColors = {
        javascript: '#f1e05a',
        typescript: '#3178c6',
        c: '#555555',
        'c++': '#f34b7d',
        kotlin: '#7f97d6',
        dart: '#00b4ab',
        python: '#3572A5',
        jupyter: '#f37626',
        ruby: '#701516',
        'ruby on rails': '#cc0000',
        kubernetes: '#326ce5',
        opengl: '#5586a2',
        rust: '#dea584',
        golang: '#00acd7',
        react: '#61dafb',
        nextjs: '#000000',
        qt: '#41cd52',
    };

    const renderLanguageDots = () => {
        if (props.repo.language) {
            const language = props.repo.language.toLowerCase();
            const backgroundColor = languageColors[language] || '#2ea44f';

            return (
                <div style={{ display: 'flex', alignItems: 'center', marginTop: '8px' }}>
                    <div
                        style={{
                            width: '10px',
                            height: '10px',
                            borderRadius: '50%',
                            backgroundColor: backgroundColor,
                            marginRight: '8px',
                        }}
                    />
                    <Typography variant="body2" color="#c9d1d9">
                        {props.repo.language}
                    </Typography>
                </div>
            );
        }
        return null;
    };

    return (
        <Card
            style={{
                margin: 25,
                width: 300,
                borderRadius: 12,
                overflow: 'hidden',
                backgroundColor: '#0d1117',
                boxShadow: '0px 8px 24px rgba(0, 0, 0, 0.1)',
                cursor: 'pointer',
            }}
            onClick={() => {
                window.location.href = props.repo.html_url;
            }}
        >
            <CardActionArea>
                <CardMedia
                    component="img"
                    style={{
                        objectFit: 'cover',
                        width: '100%',
                        height: '150px',
                    }}
                    image={props.repo.owner.avatar_url}
                    alt="Repository Image"
                />
                <CardContent style={{ padding: '16px' }}>
                    <Typography
                        variant="h6"
                        component="div"
                        color={'#58a6ff'}
                        style={{ fontWeight: '600', marginBottom: '8px', maxHeight: '48px', overflow: 'hidden' }}
                    >
                        {props.repo.full_name}
                    </Typography>
                    <Typography
                        variant="body2"
                        color="#c9d1d9"
                        style={{ marginBottom: '8px', maxHeight: '60px', overflow: 'hidden' }}
                    >
                        {props.repo.description}
                    </Typography>
                    <Typography variant="body2" color="#c9d1d9" style={{ marginBottom: '8px' }}>
                        <StarIcon style={{ fontSize: '16px', verticalAlign: 'bottom' }} />
                        {' '}
                        Stars: {props.repo.stargazers_count}
                    </Typography>
                    <Typography variant="body2" color="#c9d1d9" style={{ marginBottom: '8px' }}>
                        <CallSplitIcon style={{ fontSize: '16px', verticalAlign: 'bottom' }} />
                        {' '}
                        Forks: {props.repo.forks_count}
                    </Typography>
                    {renderLanguageDots()}
                </CardContent>
            </CardActionArea>
        </Card>
    );
}
