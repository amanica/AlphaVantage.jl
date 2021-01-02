@testset "Fundamental Values" begin 

vals = rand([AlphaVantage.INCOME_STATEMENT_KEYS; 
             AlphaVantage.CASH_FLOW_KEYS; 
             AlphaVantage.BALANCE_SHEET_KEYS; 
             AlphaVantage.EARNINGS_KEYS_Q; 
             AlphaVantage.EARNINGS_KEYS_A], MAX_TESTS)

for val in vals
    @testset "$val" begin
        @testset "Annual" begin
            fnameA = Symbol(val * "_" * "annuals")
            @eval begin
                aRes = $(fnameA)("AAPL")
                @test length(aRes) == 2
            end
        end
        sleep(TEST_SLEEP_TIME + 2*rand())
        @testset "Quarterly" begin
            fnameQ = Symbol(val * "_" * "quarterlys")
            @eval begin
                qRes = $(fnameQ)("AAPL")
                @test length(qRes) == 2
            end
        end
    end
end

end