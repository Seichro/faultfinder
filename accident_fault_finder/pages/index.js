import Head from "next/head";

import { Geist, Geist_Mono } from "next/font/google";
import styles from "@/styles/Home.module.css";
import { useState } from "react";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export default function Home() {
  const [vehicle1Facts, setVehicle1Facts] = useState("");
  const [vehicle2Facts, setVehicle2Facts] = useState("");
  async function onSubmit(event) {
    event.preventDefault()
 
    const formData = new FormData(event.currentTarget)
    // const response = await fetch('/api/submit', {
    //   method: 'POST',
    //   body: formData,
    // })
    let vehicleFacts = "";
    let vehicle = "";
    for(const pair of formData.entries()){
      vehicle = pair[0];
      vehicleFacts += `${pair[1]}(${pair[0]}).\n`;
    }

    if(vehicle === "vehicle1"){
      setVehicle1Facts(vehicleFacts);
    }
    else{
      setVehicle2Facts(vehicleFacts);
    }
    console.log(vehicleFacts);
    console.log(vehicle1Facts); 
    console.log(vehicle2Facts);
    // Handle response if necessary
    // const data = await response.json()
    // ...
  }
  return (
    <>
      <Head>
        <title>Accident Fault Finder</title>
        <meta name="description" content="Created by Vikranth and Anthony" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
        <main className={styles.main}>
          {/* <ol>
            <li>
              Get started by editing <code>pages/index.js</code>
            </li>
            <li>Save and see your changes instantly.</li>
          </ol> */}
          

          {/* <div className={styles.ctas}>
            <p>Hi</p>
          </div> */}
          <form onSubmit={onSubmit}>
            {/* On submission, the input value will be appended to 
                the URL, e.g. /search?query=abc */}
            <h2>Vehicle 1</h2>
            <input type="checkbox" name="vehicle1" value="drunkDriving" />
            <label for="vehicle1"> Drunk Driving</label><br />
            <input type="checkbox" name="vehicle1" value="distractedDriving" />
            <label for="vehicle1"> Distracted Driving</label><br />
            <input type="checkbox" name="vehicle1" value="offTrack" />
            <label for="vehicle1"> Off Track</label><br />
            <input type="checkbox" name="vehicle1" value="speeding" />
            <label for="vehicle1"> Speeding(10-25mph over speedlimit)</label><br />
            <input type="checkbox" name="vehicle1" value="extremeSpeeding" />
            <label for="vehicle1"> Speeding(25mph over speedlimit)</label><br />
            <input type="checkbox" name="vehicle1" value="noTurnSignal" />
            <label for="vehicle1"> No Indicator Turn/Lane Change</label><br />
            <input type="checkbox" name="vehicle1" value="improperTurn" />
            <label for="vehicle1"> Improper Turn</label><br />
            <h4>Accident Type(vehicle 1 "Selected Option" vehicle 2)</h4>
            <input type="radio" name="vehicle1" value="rearEnd" />
            <label for="vehicle1"> Rear End</label><br />
            <input type="radio" name="vehicle1" value="headOnCollision" />
            <label for="vehicle1"> Head On Collision</label> <br />
            <input type="radio" name="vehicle1" value="sideImpact" />
            <label for="vehicle1"> Side Impact</label><br />
            <input type="radio" name="vehicle1" value="sideSwipe" />
            <label for="vehicle1"> Side Swipe</label><br />
            <button type="submit">Submit</button>
          </form>
          <form onSubmit={onSubmit}>
            {/* On submission, the input value will be appended to 
                the URL, e.g. /search?query=abc */}
            <h2>Vehicle 2</h2>
            <input type="checkbox" name="vehicle2" value="drunkDriving" />
            <label for="vehicle1"> Drunk Driving</label><br />
            <input type="checkbox" name="vehicle2" value="distractedDriving" />
            <label for="vehicle1"> Distracted Driving</label><br />
            <input type="checkbox" name="vehicle2" value="offTrack" />
            <label for="vehicle1"> Off Track</label><br />
            <input type="checkbox" name="vehicle2" value="speeding" />
            <label for="vehicle1"> Speeding(10-25mph over speedlimit)</label><br />
            <input type="checkbox" name="vehicle2" value="extremeSpeeding" />
            <label for="vehicle1"> Speeding(25mph over speedlimit)</label><br />
            <input type="checkbox" name="vehicle2" value="noTurnSignal" />
            <label for="vehicle1"> No Indicator Turn/Lane Change</label><br />
            <input type="checkbox" name="vehicle2" value="improperTurn" />
            <label for="vehicle1"> Improper Turn</label><br />
            <h4>Accident Type(vehicle 2 "Selected Option" vehicle 1)</h4>
            <input type="radio" name="vehicle2" value="rearEnd" />
            <label for="vehicle1"> Rear End</label><br />
            <input type="radio" name="vehicle2" value="headOnCollision" />
            <label for="vehicle1"> Head On Collision</label> <br />
            <input type="radio" name="vehicle2" value="sideImpact" />
            <label for="vehicle1"> Side Impact</label><br />
            <input type="radio" name="vehicle2" value="sideSwipe" />
            <label for="vehicle1"> Side Swipe</label><br />
            <button type="submit">Submit</button>
          </form>
          <code>
            {<h2>FACTS</h2>}
            {`% VEHICLE 1 FACTS \n`} 
            {`${vehicle1Facts}`}
            {`% VEHICLE 2 FACTS \n`} 
            {`${vehicle2Facts}`}
          </code>
        </main>
    </>
  );
}
