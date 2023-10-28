import { Account,Client } from 'appwrite';

const client = new Client();

client.setEndpoint('https://cloud.appwrite.io/v1').setProject('653d3736ea91f4f5a90f')

export const account = new Account(client)