<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoSim.com: Car Crash Simulation</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>CRASH SIMULATOR</h1>
            <p>Biomechanical Injury Risk Assessment Engine</p>
        </header>

        <div class="grid">
            <!-- Configuration Panel -->
            <div class="card panel">
                <h2>1. Telemetry Configuration</h2>
                <form id="simForm">
                    <div class="form-group">
                        <label>Biological Profile</label>
                        <select id="gender" required>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Height (cm)</label>
                            <input type="number" id="height" value="175" min="100" max="250" required>
                        </div>
                        <div class="form-group">
                            <label>Weight (kg)</label>
                            <input type="number" id="weight" value="75" min="30" max="250" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Vehicle Make & Model</label>
                        <input type="text" id="carModel" value="Standard Sedan" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Model Year</label>
                            <input type="number" id="carYear" value="2018" min="1950" max="2027" required>
                        </div>
                        <div class="form-group">
                            <label>Impact Speed (km/h)</label>
                            <input type="number" id="speed" value="50" min="10" max="200" required>
                        </div>
                    </div>

                    <button type="submit" class="btn-trigger">Run Impact Telemetry</button>
                </form>
            </div>

            <!-- Simulation Outputs -->
            <div class="card outputs">
                <h2>2. Impact Diagnostics</h2>
                
                <div class="metrics-summary">
                    <div class="metric-box">
                        <span class="label">Kinetic Energy</span>
                        <span class="value" id="energyValue">0.00 kJ</span>
                    </div>
                    <div class="metric-box">
                        <span class="label">Total Severe Injury Risk</span>
                        <span class="value critical" id="overallRisk">0%</span>
                    </div>
                </div>

                <h3>Injury Breakdown by Region</h3>
                <div class="breakdown">
                    <div class="injury-row">
                        <span>Head & Neck Traumatic Injury:</span>
                        <div class="progress-container">
                            <div class="progress-bar" id="barHead"></div>
                        </div>
                        <span class="percentage-label" id="txtHead">0%</span>
                    </div>
                    <div class="injury-row">
                        <span>Thoracic / Chest Compression:</span>
                        <div class="progress-container">
                            <div class="progress-bar" id="barChest"></div>
                        </div>
                        <span class="percentage-label" id="txtChest">0%</span>
                    </div>
                    <div class="injury-row">
                        <span>Pelvic & Lower Extremity Fracture:</span>
                        <div class="progress-container">
                            <div class="progress-bar" id="barPelvis"></div>
                        </div>
                        <span class="percentage-label" id="txtPelvis">0%</span>
                    </div>
                </div>

                <div class="notes" id="simulationNotes">
                    Configure telemetry metrics and run impact to view crash dynamics notes.
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
