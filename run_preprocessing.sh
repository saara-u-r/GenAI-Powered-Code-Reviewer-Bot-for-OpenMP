#!/bin/bash
# Run the preprocessing pipeline

echo "Running preprocessing..."
python src/collect_data.py

echo "Running analysis..."
python src/analyze_mappings.py

echo "Preprocessing complete!"
