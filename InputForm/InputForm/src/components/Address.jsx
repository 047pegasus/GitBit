import * as React from 'react';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import TextField from '@mui/material/TextField';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';

export default function AddressForm() {
  return (
    <React.Fragment>
      <Grid container spacing={3}>
        <Grid item xs={12}>
          <TextField
            required
            id="Name"
            name="Name"
            label="Name"
            fullWidth
            autoComplete="given-name"
            variant="standard"
          />
        </Grid>
        {/* <Grid item xs={12} sm={6}>
          <TextField
            required
            id="lastName"
            name="lastName"
            label="Last name"
            fullWidth
            autoComplete="family-name"
            variant="standard"
          />
        </Grid> */}
        <Grid item xs={12}>
          <TextField
            required
            id="email"
            name="email"
            label="Email"
            fullWidth
            autoComplete="email"
            variant="standard"
          />
        </Grid>
        <Grid item xs={12} sm={6}>
          <TextField
            required
            id="Gender"
            name="Gernder"
            label="Gender"
            fullWidth
            autoComplete="gender"
            variant="standard"
          />
        </Grid>
        <Grid item xs={12} sm={6}>
          <TextField
            required
            id="Username"
            name="Username"
            label="GitHub Username"
            fullWidth
            autoComplete="username"
            variant="standard"
          />
        </Grid>
        <Typography style={{ marginTop : "20px" , marginLeft : "20px" , marginBottom: "10px"}}>Social Links</Typography>
        <Grid item xs={12} sm={3} style={{ marginTop : "20px" , marginLeft : "-5vh"}}>
          <TextField
            id="twitter"
            name="twitter"
            label="Twitter"
            fullWidth
            variant="standard"
          />
        </Grid>
        <Grid item xs={12} sm={3} style={{ marginTop : "20px"}}>
          <TextField
            id="github"
            name="github"
            label="Github"
            fullWidth
            autoComplete="link"
            variant="standard"
          />
        </Grid>
        <Grid item xs={12} sm={3} style={{ marginTop : "20px"}}>
          <TextField
            id="country"
            name="country"
            label="Country"
            fullWidth
            autoComplete="shipping country"
            variant="standard"
          />
        </Grid>
        <Grid item xs={12}>
          <FormControlLabel
            control={<Checkbox color="secondary" name="saveAddress" value="yes" />}
            label="I agree with the github's privacy policy"
          />
        </Grid>
      </Grid>
    </React.Fragment>
  );
}