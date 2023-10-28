import {useEffect, useRef, useState} from "react";
import axios from "axios";
import { Editor } from '@tinymce/tinymce-react';

const ogValue = `
name: Farming

on:
  schedule:
    - cron: '0 12 * * *' #Will Trigger at Noon Everyday

  # Manually Running this WorkFlow from the Actions Tab
  workflow_dispatch:

jobs:
  commit:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Run Script
        run: |
          git config --global user.name \${GITHUB_ACTOR}
          git config --global user.email \${{ secrets.USER_EMAIL }}
          git commit --allow-empty -m 'Farming Time:'
          git push origin main
  `;
function ForestFarmer() {
    const editorRef = useRef();

    return (
        <div style={{
            paddingRight: '300px',
            paddingLeft: '300px',
            paddingTop: '100px',
        }}>
            <Editor
                onInit={(evt, editor) => {
                    editorRef.current = editor;
                }}
                initialValue= {ogValue}
            />
        </div>
    );
}

export default ForestFarmer;