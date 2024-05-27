library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity neuron_tb is
    -- Testbench has no ports
end neuron_tb;

architecture behavior of neuron_tb is 
    -- Component declaration for the Unit Under Test (UUT)
    component neuron
        Port (
            clk             : in STD_LOGIC;
            rst             : in STD_LOGIC;
            input_vector    : in STD_LOGIC_VECTOR(95 downto 0);
            weight_vector   : in STD_LOGIC_VECTOR(95 downto 0);
            output_value    : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Signal declarations
    signal clk             : STD_LOGIC := '0';
    signal rst             : STD_LOGIC := '1';
    signal input_vector    : STD_LOGIC_VECTOR(95 downto 0) := (others => '0');
    signal weight_vector   : STD_LOGIC_VECTOR(95 downto 0) := (others => '0');
    signal output_value    : STD_LOGIC_VECTOR(31 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: neuron port map (
        clk             => clk,
        rst             => rst,
        input_vector    => input_vector,
        weight_vector   => weight_vector,
        output_value    => output_value
    );

    -- Clock process definitions
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset activation
        rst <= '1';
        wait for clk_period * 2;
        rst <= '0';
        
        -- Test case 1: Non-zero output
        input_vector <= "00000000000000000000000000000010" & -- Input 1: 2
                        "00000000000000000000000000000011" & -- Input 2: 3
                        "00000000000000000000000000000100"; -- Input 3: 4
        weight_vector <= "00000000000000000000000000000001" & -- Weight 1: 1
                         "00000000000000000000000000000001" & -- Weight 2: 1
                         "00000000000000000000000000000001"; -- Weight 3: 1
        wait for clk_period * 10;

        -- Test case 2: Zero output due to negative weighted sum
        input_vector <= "11111111111111111111111111111110" & -- Input 1: -2 (two's complement)
                        "00000000000000000000000000000001" & -- Input 2: 1
                        "11111111111111111111111111111111"; -- Input 3: -1 (two's complement)
        weight_vector <= "00000000000000000000000000000001" & -- Weight 1: 1
                         "00000000000000000000000000000001" & -- Weight 2: 1
                         "00000000000000000000000000000001"; -- Weight 3: 1
        wait for clk_period * 10;

        -- Finish simulation
        wait;
    end process;
end behavior;